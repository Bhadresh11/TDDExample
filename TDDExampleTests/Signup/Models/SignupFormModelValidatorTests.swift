//
//  SignupFormModelValidatorTests.swift
//  TDDExampleTests
//
//  Created by iosuser on 03/01/23.
//

import XCTest
@testable import TDDExample

final class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    func testSignupFormModelValidator_WhenValidUserNameProvided_ShouldReturnTrue(){
        
        //Arrange
        
        
        //Act
        let isUserNameValid = sut.isUserNameValid(username: "iOS")
        
        //Assert
        XCTAssertTrue(isUserNameValid, "isUserNameValid should have returned True for a valid first name but returned false")
        
    }
    
    
    func testSignupFormModelValidator_WhenUserNameProvidedTooShort_ShouldReturnFalse(){
            
        //Arrange
       
        
        //Act
        let isUserNameValid = sut.isUserNameValid(username: "r")
        
        //Assert
        XCTAssertFalse(isUserNameValid, "isUserNameValid should have returned False for a username having less than \(SignupConstant.usernameMinLength) characters but it has returned true")

    }
    
    func testSignupFormModelValidator_WhenUserNameProvidedTooLong_ShouldReturnFalse(){
            
        //Arrange
        
        
        
        //Act
        let isUserNameValid = sut.isUserNameValid(username: "iOSiOSiOS")
        
        
        //Assert
        XCTAssertFalse(isUserNameValid, "isUserNameValid should have returned False for a username having more than \(SignupConstant.usernameMaxLength) characters but it has returned true")
    }
    
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue(){
            //Arrange
            
            //Act
            let isEmailValid = sut.isValidEmailFormat(email: "iOS@gmail.com")
            
            //Assert
            XCTAssertTrue(isEmailValid, "isEmailValid should return true for a valid email but it has returned false")
    }
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue(){
            //Arrange
            
            //Act
            let isPasswordValid = sut.isPasswordValid(password:"123456")
            
            //Assert
            XCTAssertTrue(isPasswordValid, "isPasswordValid should return true for a valid password instead it has returned false")
    }
    
    func testSignupFormModelValidator_WhenPasswordProvidedTooShort_ShouldReturnFalse(){
            //Arrange
            
            //Act
            let isPasswordValid = sut.isPasswordValid(password:"1")
            
            //Assert
            XCTAssertFalse(isPasswordValid, "isPasswordValid should have returned False for a password having less than \(SignupConstant.passwordMinLength) characters but it has returned true")
    }
    
    func testSignupFormModelValidator_WhenPasswordProvidedTooLong_ShouldReturnFalse(){
            //Arrange
            
            //Act
            let isPasswordValid = sut.isPasswordValid(password:"1234567890123456789")
            
            //Assert
            XCTAssertFalse(isPasswordValid, "isPasswordValid should have returned False for a password having more than \(SignupConstant.passwordMaxLength) characters but it has returned true")
    }
    
    func testSignupFormModelValidator_WhenSamePasswordsProvided_ShouldReturnTrue(){
            //Arrange
            
            //Act
            let doPasswordsMatch = sut.doPasswordsMatch(password: "123456", repeatPassword: "123456")
            
            //Assert
            XCTAssertTrue(doPasswordsMatch, "doPasswordsMatch should have returned True for matching passwords but it has returned true")
    }


}
