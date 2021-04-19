//
//  RefeicoesTableViewController.swift
//  alura-parte1
//
//  Created by Administrator on 3/21/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate{
    
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        //guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        
        refeicoes = RefeicaoDao().recupera()
    }
    
            
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell( style: .default, reuseIdentifier:  nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        //guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        
        RefeicaoDao().save(refeicoes)
        
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula ) else {return}
            
            let refeicao = refeicoes[indexPath.row]
            
            //print("refeicao \(refeicao.nome)")          
            
//            func removeRefeicao(alerta: UIAlertAction){
//                //print("remover refeição: \(refeicaoSelecionada.nome)")
//                refeicoes.remove(at: indexPath.row)
//                tableView.reloadData()
//            }
            
            RemoveRefeicaoViewController.init(controller: self).exibe(refeicao, handler: { alerta in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            
            
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewC = segue.destination as? ViewController {
                viewC.delegate = self
            }
        } 
    }
    
}
