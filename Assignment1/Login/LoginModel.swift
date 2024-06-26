//
//  LoginModel.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 24/06/24.
//

import Foundation

enum Validation {
    case success
    case failure(msg: String)
}

struct LoginModel {
   private let kuserName = "Vibhash"
   private let kpassword = "1234"
    
    var userName: String
    var password: String
    
    var isUserCredentialValid: Bool
    
    func validateUserCredential(userId: String?, password: String?) -> Validation {
        guard !((userId ?? "").isEmpty) ,userId == kuserName else {
            return Validation.failure(msg: "User Id is not found")
        }
        guard !((password ?? "").isEmpty) ,password == kpassword else {
            return Validation.failure(msg: "Password is not valid please check again")
        }
        return Validation.success
    }
    
}
