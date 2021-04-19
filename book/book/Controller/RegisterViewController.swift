//
//  RegisterViewController.swift
//  book
//
//  Created by Arlindo Junior on 18/04/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var imageLogo: UIImageView!

    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var viewHeader: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewHeader.layer.cornerRadius = 40
        self.viewHeader.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.imageLogo.image = UIImage(named: "books.png")
        
        buttonRegister.backgroundColor = UIColor(red: 1.00, green: 0.56, blue: 0.32, alpha: 1.00)
        buttonRegister.layer.cornerRadius = 10
        buttonRegister.layer.masksToBounds = true      
        
        
        textFieldName.layer.cornerRadius = 10
        textFieldName.layer.masksToBounds = true
        textFieldEmail.layer.cornerRadius = 10
        textFieldEmail.layer.masksToBounds = true
        textFieldPassword.layer.cornerRadius = 10
        textFieldPassword.layer.masksToBounds = true
        textFieldConfirmPassword.layer.cornerRadius = 10
        textFieldConfirmPassword.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }
    
    func createParameterLogin() -> Dictionary<String, String>{
        
        guard let name = textFieldName.text, let email = textFieldEmail.text, let password = textFieldPassword.text, let confirm = textFieldConfirmPassword.text else { return [:] }
        debugPrint("montou register")
        if(confirm != password){
            return [:]
        }
        debugPrint("validou register")
        let parameter: Dictionary<String, String> = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        debugPrint(parameter)
        return parameter
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func buttonRegister(_ sender: Any) {
        let json = createParameterLogin()
        debugPrint(json)
        if(json != [:]){
            UserAPI().create(param: json)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
