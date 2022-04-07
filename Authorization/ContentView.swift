//
//  ContentView.swift
//  Authorization
//
//  Created by Arseniy Matus on 04.04.2022.
//

import SwiftUI


struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    
    @State private var isShowingSignInAvtorization = false
    @State private var signInMessage = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    
                    
                    VStack(spacing: 10) {
                        Spacer()
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Login")
                            TextField("", text: $login)
                            DividerView()
                        }
                        VStack(alignment: .leading) {
                            Text("Password")
                            SecureFieldView(text: $password)
                            DividerView()
                        }
                        
                        Spacer()
                        Button {
                            Task {
                                signInMessage = await User(login: login, password: password).signIn()
                                isShowingSignInAvtorization = true
                            }
                        } label: {
                            ZStack {
                                Text("Sign in")
                                    .fontWeight(.bold)
                            }
                        }
                        .buttonStyle(RoundedRectangleButtonStyle())
                        Spacer()
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .font(.callout)
                    .padding(.horizontal, 50)
                    .foregroundColor(.textColor)
                    
                    
                    HStack() {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Don't have an account?")
                                .opacity(0.5)
                                .padding(.horizontal)
                            NavigationLink {
                                SignUpView()
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
            .alert("Done", isPresented: $isShowingSignInAvtorization) {
                Button("OK") {}
            } message: {
                Text(signInMessage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
