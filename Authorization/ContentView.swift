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

    @State private var isShowingSignUpAvtorization = false
    @State private var signUpMessage = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter login", text: $login)
                    TextField("Enter password", text: $password)
                }
                Section {
                    Button("Sign up") {
                        Task {
                            signUpMessage = await User(login: login, password: password).signUp()
                            isShowingSignUpAvtorization = true
                        }
                    }
                }
            }
            .navigationTitle("Authorization")
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
