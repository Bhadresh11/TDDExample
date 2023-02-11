//
//  SignupErrors.swift
//  TDDExample
//
//  Created by iosuser on 04/01/23.
//

import Foundation

enum SignupErrors:Error, Equatable{
    case invalidResponseModelError
    case invalidRequestURLStringError
    case failedRequest(description:String)
}
