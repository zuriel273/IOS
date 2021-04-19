//
//  SecurityAPI.swift
//  book
//
//  Created by Arlindo Junior on 12/04/21.
//

import UIKit
import Alamofire

class SecurityAPI: NSObject {
    
    func login(param: Dictionary<String, String>, handler: @escaping (String?) -> Void) -> Void{
        //var tokenResult : String? = nil
        guard let url = URL(string: "http://127.0.0.1:8080/security/token") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseJSON { response in
            switch response.result {
            case .success:
                print("passou")
                debugPrint(response.value)
                guard let values = response.value as? Dictionary<String, Any> else {return}
                guard let token = values["token"] as? String else {return}
                debugPrint(token)
                handler(token)
                break
            case .failure:
                print(response.error!)
                handler(nil)
            }
            
        }
        
        
        
        //return tokenResult
        //debugPrint(result)
    }

}
