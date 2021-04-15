//
//  ViewController.swift
//  alura-parte1
//
//  Created by Administrator on 3/19/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
        
       
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    //var itens: [Item] = ["Molho de tomate", "Queijo", "Pimenta", "Frango"]
    var itens: [Item] = []
    
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets

    @IBOutlet weak var nomeTextField: UITextField?
    
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        
        itens = ItemDao().recupera()
    }
    
    /*
     override func viewDidLoad() {
         //guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
         
         guard let caminho = recuperaDiretorio() else {return}
         
         do {
             let dados = try Data(contentsOf: caminho)
             guard let refeicoesSalvas = try
                 NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else {return}
             refeicoes = refeicoesSalvas
         }catch {
             print(error.localizedDescription)
         }
     }
     */
    
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        //itensTableView?.reloadData()
        if let tableView  = itensTableView {
            tableView.reloadData()
        }else{
            Alerta(controller: self).exibe(mensagem: "Não foi possível atualizar a tabela")
        }
        
        ItemDao().save(itens)
    }
    
    
    
    //MARCK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell( style: .default, reuseIdentifier:  nil)
        let item = itens[indexPath.row]
        celula.textLabel?.text = item.nome
        return celula
    }
    
    //MARCK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        guard let celula = tableView.cellForRow(at: indexPath) else {return }
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaTabela = indexPath.row
            itensSelecionados.append(itens[linhaTabela])
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
            }
            
            
        }
    }
    
    func recuperaRefeicao() -> Refeicao? {
        guard let nome = nomeTextField?.text, let  felicidadeRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeRefeicao) else {
                    Alerta(controller: self).exibe(mensagem: "Erro ao adicionar refeição")
                    return nil
                }
        
        let refeicao = Refeicao(nome: nome, felicidade: felicidade, itens: itensSelecionados )
        print("come \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade) ")
        return refeicao
    }
    
    //MARK: - IBActions
    
    @IBAction func adcionar() {
        
        guard let refeicao = recuperaRefeicao() else {return}
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }

}

