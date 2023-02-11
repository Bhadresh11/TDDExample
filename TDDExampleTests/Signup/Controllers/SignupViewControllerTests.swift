//
//  SignupViewControllerTests.swift
//  TDDExampleTests
//
//  Created by iosuser on 06/01/23.
//

import XCTest
@testable import TDDExample

final class SignupViewControllerTests: XCTestCase {

    var storyboard:UIStoryboard!
    var sut:SignupViewController!

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name:"Main", bundle:nil)
        sut = (storyboard.instantiateViewController(withIdentifier: "SignupViewControllerIdentifier") as? SignupViewController)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }

    
    func testSignupViewController_WhenCreated_WillHaveRequiredFieldsEmpty() throws {
        
        let usernameTextField = try XCTUnwrap(sut.usernameTextField, "Username text field doesn't have an IBOutlet")
        XCTAssertEqual(usernameTextField.text, "", "Username text field was not empty when the vc initially loaded")
        
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email text field doesn't have an IBOutlet")
        XCTAssertEqual(emailTextField.text, ".", "Email text field was not empty when the vc initially loaded")
        
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "Password text field doesn't have an IBOutlet")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when the vc initially loaded")
        
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "Repeat Password text field doesn't have an IBOutlet")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat Password text field was not empty when the vc initially loaded")
        
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonWithAction() throws{
        
        let signupBtn: UIButton = try XCTUnwrap(sut.signupBtn, "Signup btn doesn't have an IBOutlet")
        
        let signupBtnActions = signupBtn.actions(forTarget: sut, forControlEvent: .touchUpInside)
        XCTAssertEqual(signupBtnActions?.count, 1)


    }
    

}
