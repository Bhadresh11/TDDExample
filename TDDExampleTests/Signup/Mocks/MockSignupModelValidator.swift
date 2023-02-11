//
//  MockSignupModelValidator.swift
//  TDDExampleTests
//
//  Created by iosuser on 05/01/23.
//

import Foundation
@testable import TDDExample

class MockSignupModelValidator:SignupModelValidatorProtocol{
    var isUserNameValidated:Bool = false
    var isEmailValidated:Bool = false
    var isPasswordValidated:Bool = false
    var isPasswordEqualityValidated:Bool = false
    
    func isUserNameValid(username: String) -> Bool {
        isUserNameValidated = true
        return isUserNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
}
