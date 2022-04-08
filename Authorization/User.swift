//
//  SignInUser.swift
//  Authorization
//
//  Created by Arseniy Matus on 04.04.2022.
//

import Foundation

let apiurl = "https://authapp.crazy-lazy.space/"


struct User: Codable {
    var login: String
    var password: String
    
    
    func signUp() async -> String {
        guard let encoded = try? JSONEncoder().encode(self) else {
            return ("Failed to encode \(self.login)")
            
        }
        
        if let url = URL(string: apiurl + "user/sign-up") {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            do {
                let (_, response) = try await URLSession.shared.upload(for: request, from: encoded)
                if let response = response as? HTTPURLResponse {
                    return String(response.statusCode)
                }
                
            } catch {
                return "Sign up failed for \(login)"
            }
        }
        
        return "Sign up failed for \(login)"
        
    }
    
    func signIn() async -> String {
        guard let encoded = try? JSONEncoder().encode(self) else {
            return "Failed to encode \(login)"
        }
        
        var status: String = ""
        
        if let url = URL(string: apiurl + "user/sign-in") {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            do {
                let(data, response) = try await URLSession.shared.upload(for: request, from: encoded)
                if let response = response as? HTTPURLResponse {
                    status = String(response.statusCode)
                }
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let token = json["token"] as? String {
                        return token
                    }
                }
                return status
                
            } catch {
                return status
            }
            
        }
        
        return status
    }
}


func checkToken(_ token: String) -> Bool {
    
    var temp = false
    
    if let url = URL(string: apiurl + "user/private".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "token")
        request.addValue("text/plain; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let semaphore = DispatchSemaphore(value: 0)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                temp = true
                semaphore.signal()
                print("Response data string:\n \(dataString)")
            }
        }.resume()

        semaphore.wait()
        
        return temp
    }
    return temp
    
    
}
