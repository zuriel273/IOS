//
//  UserAPI.swift
//  book
//
//  Created by Arlindo Junior on 18/04/21.
//

import UIKit
import Alamofire

class UserAPI: NSObject {
    
    func create(param: Dictionary<String,String>) -> Void{
        //var tokenResult : String? = nil
        guard let url = URL(string: "http://127.0.0.1:8080/users") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseJSON { response in
            switch response.result {
            case .success:
                debugPrint(response.value)
                break
            case .failure:
                print(response.error!)
                
            }            
        }
        
    }
}
