//
//  SignupModelValidatorProtocol.swift
//  TDDExample
//
//  Created by iosuser on 05/01/23.
//

import Foundation

protocol SignupModelValidatorProtocol{
    func isUserNameValid(username:String) -> Bool
    func isValidEmailFormat(email:String) -> Bool
    func isPasswordValid(password:String) -> Bool
    func doPasswordsMatch(password:String, repeatPassword:String) -> Bool
}
