//
//  SignupPresenterTests.swift
//  TDDExampleTests
//
//  Created by iosuser on 05/01/23.
//

import XCTest
@testable import TDDExample

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var sut: SignupPresenter!

    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(username:"iOS", email:"iOS@gmail.com", password:"12345", repeatPassword:"123456")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator:mockSignupModelValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil

    }

    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty(){
        //Arrange
                
        //Act
        sut.processUserSignup(formModel:signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isUserNameValidated, "Username was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email Format is not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password is not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Password equality is not validated")


    }
    
    func testSignupPresenter_WhenProvidedValidFormModel_ShouldCallSignupMethod(){
            
        //Arrange
    
        
        //Act
       sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
        
        

    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallSuccessOnViewDelegate(){
        
        //Arrange
        let delegateExpectation = expectation(description:"Expected the successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = delegateExpectation
        
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [delegateExpectation], timeout: 5)
        
        //Assert
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 1, "The SuccessfullSignup method was called more than one time.")

        
    }
    
    func testSignupPresenter_WhenSignupOperationFails_CallErrorHandlerOnViewDelegate(){
        
        //Arrange
        let errorHandlerExpectation = expectation(description:"Expected the errorHandler() method to be called")
        mockSignupViewDelegate.expectation = errorHandlerExpectation
        mockSignupWebService.shouldReturnError = true
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }


}
