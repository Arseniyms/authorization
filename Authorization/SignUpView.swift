//
//  SignUpView.swift
//  Authorization
//
//  Created by Arseniy Matus on 07.04.2022.
//

import SwiftUI

struct SignUpView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var signUpMessage = ""
    @State private var isSignUpFailed = false
    
    @Environment(\.dismiss) var dismiss
    
    private var validateSignUp: Bool {
        confirmPasswords(password: password, confirm: confirmPassword) && checkLogin(login)
    }
    
    private var validatePasswords: Bool {
        confirmPasswords(password: password, confirm: confirmPassword)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 100) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Login")
                        TextField("", text: $login)
                        DividerView()
                        
                        Text("Password")
                        SecureFieldView(text: $password)
                        DividerView()
                            .foregroundColor(checkPassword(password) ? .textColor : .wrongPassword)
                        
                        Text("Confrim password")
                        SecureFieldView(text: $confirmPassword)
                        DividerView()
                            .foregroundColor(checkPassword(password) ? .textColor : .wrongPassword)
                        
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Login should be at least 8 characters")
                                .opacity(!checkLogin(login) ? 0.5 : 0)
                            Text("Password should be at least 8 charachters, with one capital letter and one number")
                                .opacity(!checkPassword(password) ? 0.5 : 0)
                            Text("Passwords do not match")
                                .opacity(!validatePasswords ? 0.5 : 0)
                        }
                        .font(.caption2)
                    }
                    
                    
                    VStack {
                        Button {
                            Task {
                                signUpMessage = await User(login: login, password: password).signUp()
                                if signUpMessage == "200" {
                                    dismiss()
                                }
                                else {
                                    isSignUpFailed = true
                                }
                            }
                        } label: {
                            ZStack {
                                Text("Sign up")
                                    .fontWeight(.bold)
                                    .foregroundColor(validateSignUp ? .textColor : .gray)
                            }
                        }
                        .buttonStyle(RoundedRectangleButtonStyle())
                        .disabled(!validateSignUp)
                        
                        Button("Sign in") {
                            dismiss()
                        }
                        .opacity(0.5)
                        .foregroundColor(.textColor)
                        .offset(x:0, y: 20)
                    }
                    
                    
                    Spacer()
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .foregroundColor(.textColor)
                .font(.callout)
                .padding(.horizontal, 50)
                
                Spacer()
                Spacer()
            }
        }
        .alert("Registration failed", isPresented: $isSignUpFailed) {
            Button("Retry") { }
        } message: {
            Text(signUpMessage)
        }
        .navigationBarHidden(true)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
