//
//  MockSignupViewDelegate.swift
//  TDDExampleTests
//
//  Created by iosuser on 06/01/23.
//

import Foundation
import XCTest
@testable import TDDExample

class MockSignupViewDelegate:SignupViewDelegateProtocol{
    
    var expectation:XCTestExpectation?
    var successfullSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError:SignupErrors?
    
    func successfullSignup() {
        successfullSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupErrors) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }

    
}
