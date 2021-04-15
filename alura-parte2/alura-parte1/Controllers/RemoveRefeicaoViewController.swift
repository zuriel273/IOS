//
//  RemoveRefeicaoViewController.swift
//  alura-parte1
//
//  Created by Administrator on 3/30/21.
//

import UIKit

class RemoveRefeicaoViewController {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let botaoOk = UIAlertAction(title: "ok", style: .cancel)
        
        alerta.addAction(botaoOk)
        
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
    
}
