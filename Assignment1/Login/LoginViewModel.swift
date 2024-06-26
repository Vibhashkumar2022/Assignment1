//
//  LoginViewModel.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 24/06/24.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
    
    @Published var loginModel: LoginModel = LoginModel(userName: "", password: "", isUserCredentialValid: false)
    
    func updateUserId(_ userName: String) {
        loginModel.userName = userName
    }
    func updatePassword(_ password: String) {
        loginModel.password = password
    }
    
    func validateUserIDpassword() -> (Bool, String)? {
       let isvalid = loginModel.validateUserCredential(userId: loginModel.userName, password: loginModel.password)
        switch isvalid {
        case .success:
            return (true, "")
        case .failure(let message):
            return (false, message)
        }
    }
}
