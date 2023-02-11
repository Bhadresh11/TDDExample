//
//  SignupWebServiceProtocol.swift
//  TDDExample
//
//  Created by iosuser on 05/01/23.
//

import Foundation

protocol SignupWebServiceProtocol{
    func signup(withForm formModel:SignupFormRequestModel, completionHandler:@escaping((SignupResponseModel?, SignupErrors?)->()))
}
