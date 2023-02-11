//
//  MockSignupWebService.swift
//  TDDExampleTests
//
//  Created by iosuser on 05/01/23.
//

import Foundation
@testable import TDDExample

class MockSignupWebService:SignupWebServiceProtocol{
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: TDDExample.SignupFormRequestModel, completionHandler: @escaping ((TDDExample.SignupResponseModel?, TDDExample.SignupErrors?) -> ())) {
        isSignupMethodCalled = true
        
        if shouldReturnError{
            completionHandler(nil, SignupErrors.failedRequest(description: "Signup request was not successfull"))
        }else{
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
    

}
