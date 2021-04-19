//
//  HomeViewController.swift
//  book
//
//  Created by Arlindo Junior on 18/04/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
       

    @IBOutlet weak var collectionReading: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionReading.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellReading	= collectionView.dequeueReusableCell(withReuseIdentifier: "cellReading", for: indexPath) as! BooksCollectionViewCell
        debugPrint("Montando collection")
        debugPrint(cellReading)
        cellReading.backgroundColor = UIColor.blue
        
        return cellReading
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
