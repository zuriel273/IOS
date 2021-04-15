//
//  AdicionarItensViewController.swift
//  alura-parte1
//
//  Created by Administrator on 3/28/21.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else { return }
        
        guard let numeroCalorias = Double(calorias) else { return  }
        
        let item = Item(nome:nome, caloria: numeroCalorias)
        
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    

    

}
