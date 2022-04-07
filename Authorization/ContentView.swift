//
//  ContentView.swift
//  Authorization
//
//  Created by Arseniy Matus on 04.04.2022.
//

import SwiftUI

func myDivider() -> some View {
    Rectangle()
        .frame(height: 1)
        .opacity(0.4)
}

struct neumorphic: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal,30)
            .padding(20)
            .background(Color.backgroundColor)
            .cornerRadius(20)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    
    @State private var isShowingSignUpAvtorization = false
    @State private var signUpMessage = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Login")
                            TextField("", text: $login)
                            myDivider()
                        }
                        VStack(alignment: .leading) {
                            Text("Password")
                            SecureFieldView(text: $password)
                            myDivider()
                        }
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .font(.callout)
                    .padding(.horizontal, 50)
                    .foregroundColor(.textColor)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            signUpMessage = await User(login: login, password: password).signIn()
                            isShowingSignUpAvtorization = true
                        }
                    } label: {
                        ZStack {
                            Text("Sign in")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundColor(.textColor)
                    .buttonStyle(neumorphic(color: Color.backgroundColor))
                    
                    Spacer()
                    Spacer()
                
                    
                    HStack() {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Don't have an account?")
                                .opacity(0.5)
                                .padding(.horizontal)
                            NavigationLink {
                                
                            } label: {
                                Text("Sign up  >")
                                    .padding(.horizontal)
                            }
                        }
                        .foregroundColor(.textColor)
                        .font(.callout)
                        .padding()
                        Spacer()
                       
                        
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Sign in")
            .navigationBarHidden(true)
            .alert("Done", isPresented: $isShowingSignUpAvtorization) {
                Button("OK") {}
            } message: {
                Text(signUpMessage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
