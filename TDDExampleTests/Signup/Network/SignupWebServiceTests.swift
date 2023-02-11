//
//  SignupWebServiceTests.swift
//  TDDExampleTests
//
//  Created by iosuser on 04/01/23.
//

import XCTest
@testable import TDDExample

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel:SignupFormRequestModel!

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstant.signupURLString, urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(userName: "iOS", email: "iOS@gmail.com", password: "123456")
    }

    override func tearDownWithError() throws {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testSignupWebService_WhenRecievedSuccessfullResponse_ReturnsSuccess(){
        
        //Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Expectation")

        //Act
        sut.signup(withForm: signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }

        
        self.wait(for: [expectation], timeout: 5)

        
    }
    
    func testSignupWebService_WhenRecievedUnexpectedResponse_ReturnsError(){
        //Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
            
        let expectation = self.expectation(description: "Signup method expectation for a response that contains unexpected JSON")

        //Act
        sut.signup(withForm:signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertNil(signupResponseModel, "The response model contains unknown JSON response structure")
            XCTAssertEqual(error, SignupErrors.invalidResponseModelError, "The signup() method did not return expected json structure")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError(){
        //Arrange
        sut = SignupWebService(urlString:"")
        let expectation = self.expectation(description: "An empty request URL expectation")
        
        //Act
        sut.signup(withForm: signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignupErrors.invalidRequestURLStringError, "The signup() method did not return an expected error for an invalid request url string error")
            XCTAssertNil(signupResponseModel, "When an invalid request url string is encountered the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)

    }

    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription(){
        
        //Arrange
        let errorDescription = "The operation couldn’t be completed. (TDDExample.SignupErrors error 0.)"
        MockURLProtocol.error = SignupErrors.failedRequest(description:errorDescription)
        let expectation = self.expectation(description: "Failed Request Expectation")
        
        //Act
        sut.signup(withForm: signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignupErrors.failedRequest(description:errorDescription))
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        
    }

    

}
