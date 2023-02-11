//
//  SignupFormRequestModel.swift
//  TDDExample
//
//  Created by iosuser on 04/01/23.
//

import Foundation

struct SignupFormRequestModel:Encodable{
    let userName:String
    let email:String
    let password:String
}
