//
//  Refeicao.swift
//  alura-parte1
//
//  Created by Administrator on 3/20/21.
//

import UIKit

class Refeicao: NSObject, NSCoding {
        
    var nome: String
    var felicidade: Int
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Int, itens: [Item] = []){
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    func totalCalorias() -> Double {
        var total: Double = 0
        for i in itens {
            total += i.caloria
        }
        return total        
    }
    
    func detalhes() -> String {
        var mensagem = "felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.caloria)"
        }
        return mensagem
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! [Item]
    }
    
}
