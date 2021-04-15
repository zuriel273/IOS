//
//  ItemDao.swift
//  alura-parte1
//
//  Created by Administrator on 3/31/21.
//

import UIKit

class ItemDao {
    func save(_ itens: [Item]){
        guard let caminho = recuperaDiretorio() else {return}
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            try dados.write(to: caminho)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        guard let caminho = recuperaDiretorio() else {return []}
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Item> else {return []}
            return itensSalvos
        }catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
    }
}
