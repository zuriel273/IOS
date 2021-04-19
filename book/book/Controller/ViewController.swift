//
//  ViewController.swift
//  book
//
//  Created by Arlindo Junior on 10/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewTopHeader: UIView!
    
    @IBOutlet weak var imageTopHeader: UIImageView!
    
    @IBOutlet weak var buttonMiddle: UIButton!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewTopHeader.layer.cornerRadius = 40
        self.viewTopHeader.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.imageTopHeader.image = UIImage(named: "books.png")
        
        buttonMiddle.backgroundColor = UIColor(red: 1.00, green: 0.56, blue: 0.32, alpha: 1.00)
        buttonMiddle.layer.cornerRadius = 10
        buttonMiddle.layer.masksToBounds = true
        
        
        textFieldEmail.layer.cornerRadius = 10
        textFieldEmail.layer.masksToBounds = true
        textFieldPassword.layer.cornerRadius = 10
        textFieldPassword.layer.masksToBounds = true
        
    }
    
    func createParameterLogin() -> Dictionary<String, String>{
        
        guard let email = textFieldEmail.text, let password = textFieldPassword.text else { return [:] }
        
        let parameter: Dictionary<String, String> = [
            "email" : email,
            "password" : password
        ]
        
        return parameter
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "addGroupSegue" {
//                if let destination = segue.destination as? NewGroupTableViewController {
//                    destination.voluntary = voluntary
//                }
//            }
//            if segue.identifier == "detailGroupSegue" {
//                if let destination = segue.destination as? DetailGroupTableViewController, let group = sender as? Group {
//                    destination.group = group
//                }
//            }
        }
    
    @IBAction func buttonLogin(_ sender: Any) {
        let json = createParameterLogin()
                
        SecurityAPI().login( param: json, handler: { token in
            if token != nil {
                debugPrint("Recebeu: \(token)")
                self.performSegue(withIdentifier: "homeSegue", sender: nil)
            }            
        })
        //navigationController?.pushViewController(listBookViewController, animated: true)
        
    }
    

}

