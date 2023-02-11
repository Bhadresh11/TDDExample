//
//  SignupViewDelegateProtocol.swift
//  TDDExample
//
//  Created by iosuser on 06/01/23.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject{
    func successfullSignup()
    func errorHandler(error:SignupErrors)

}
