//
//  SignUpCorrection.swift
//  Authorization
//
//  Created by Arseniy Matus on 07.04.2022.
//

import Foundation

func checkLogin(_ login: String) -> Bool {
    login.count >= 8
}

func checkPassword(_ password: String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
    
    return passwordTest.evaluate(with: password)
}

func confirmPasswords(password: String, confirm: String) -> Bool {
    checkPassword(password) && checkPassword(confirm) && password == confirm
}
