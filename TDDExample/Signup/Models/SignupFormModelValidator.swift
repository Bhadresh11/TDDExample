//
//  SignupFormModelValidator.swift
//  TDDExample
//
//  Created by iosuser on 03/01/23.
//

import Foundation

class SignupFormModelValidator:SignupModelValidatorProtocol{
    
    func isUserNameValid(username:String) -> Bool{
        var validUserName:Bool = true
        
        if username.count < SignupConstant.usernameMinLength || username.count > SignupConstant.usernameMaxLength{
            validUserName = false
        }

        return validUserName
    }
    
    func isValidEmailFormat(email:String) -> Bool{
            NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    
    func isPasswordValid(password:String) -> Bool{
            var validPassword:Bool = true

            
            if password.count < SignupConstant.passwordMinLength || password.count > SignupConstant.passwordMaxLength{
                validPassword = false
            }
                
            return validPassword
    }
    
    func doPasswordsMatch(password:String, repeatPassword:String) -> Bool{
            password == repeatPassword
    }


}
