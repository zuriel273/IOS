//
//  Item.swift
//  alura-parte1
//
//  Created by Administrator on 3/20/21.
//

import UIKit

class Item: NSObject, NSCoding {
    var nome: String
    var caloria: Double
    
    init(nome: String, caloria: Double){
        self.nome = nome
        self.caloria = caloria
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(caloria, forKey: "caloria")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        caloria = coder.decodeDouble(forKey: "caloria")
    }

}
