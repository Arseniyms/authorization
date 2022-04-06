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
        let returnMessage = "Fail"

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
                return "Checkout failed"
            }
        }
        
        return returnMessage
        
    }
}
