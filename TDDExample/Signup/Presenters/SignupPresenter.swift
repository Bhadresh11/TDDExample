//
//  SignupPresenter.swift
//  TDDExample
//
//  Created by iosuser on 05/01/23.
//

import Foundation

class SignupPresenter{
    
    private var formModelValidator:SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
        
    init(formModelValidator:SignupModelValidatorProtocol, webservice:SignupWebServiceProtocol, delegate:SignupViewDelegateProtocol){
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
   

    
    func processUserSignup(formModel:SignupFormModel){
        if !formModelValidator.isUserNameValid(username: formModel.username){
            return
        }
        if !formModelValidator.isValidEmailFormat(email: formModel.email){
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password){
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword:formModel.repeatPassword){
            return
        }
        
        let requestModel = SignupFormRequestModel(userName: formModel.username, email: formModel.email, password: formModel.password)
        webservice.signup(withForm: requestModel){ [weak self] (responseModel, error) in
            
            if let error = error{
                self?.delegate?.errorHandler(error: error)
                return
            }

            
            if let _ = responseModel{
                self?.delegate?.successfullSignup()
                return
            }
        }

    }

}
