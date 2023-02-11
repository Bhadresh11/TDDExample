//
//  SignupWebService.swift
//  TDDExample
//
//  Created by iosuser on 04/01/23.
//

import Foundation

class SignupWebService:SignupWebServiceProtocol{
    
    private var urlString:String
    private var urlSession:URLSession
        
    init(urlString:String, urlSession:URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession
    }


    
    func signup(withForm formModel:SignupFormRequestModel, completionHandler:@escaping((SignupResponseModel?, SignupErrors?)->())){
        
        // URL
        guard let url = URL(string:urlString) else {
            completionHandler(nil, SignupErrors.invalidRequestURLStringError)
            return
        }
        
        // URL Request
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        
        
        //URL Session
        let dataTask = urlSession.dataTask(with: request){ (data, response, error) in
            
            if let requestError = error{
                completionHandler(nil, SignupErrors.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from:data){
                completionHandler(signupResponseModel, nil)
            }else{
                completionHandler(nil, SignupErrors.invalidResponseModelError)
            }
        }
        
        dataTask.resume()
        
    }

    
}
