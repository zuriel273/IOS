//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Administrator on 4/3/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    
    @IBOutlet weak var viewHoteis: UIView!
    
    @IBOutlet weak var viewPacotes: UIView!
    
    let listaViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        var viagemAtual = listaViagens[indexPath.row]
        
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelQuantidadeDeDias.text = "\( viagemAtual.quantidadeDeDias) dias"
        cell.labelPreco.text = viagemAtual.preco
        cell.ImagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        cell.ImagemViagem.layer.cornerRadius = 10
        cell.ImagemViagem.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    


}

