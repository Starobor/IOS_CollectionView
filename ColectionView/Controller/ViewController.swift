//
//  ViewController.swift
//  ColectionView
//
//  Created by Citizen on 9/17/18.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var collectonView: UICollectionView!
    
    var arrMenu: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "Coca-cola"
        blankMenu.imageName = "cola"
        
        var blankMenu2 = Menu()
        blankMenu2.name = "Coffe"
        blankMenu2.imageName = "coffe"
        
        return [blankMenu, blankMenu2]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectonView.dataSource = self
        collectonView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as?  DetailViewController {
                let menu = sender as? Menu
                print(menu ?? "nil")
                vc.menu = menu
            }
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectonView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? CollectionViewCell {
            itemCell.menu = arrMenu[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = arrMenu[indexPath.row]
        self.performSegue(withIdentifier: "showVC", sender: menu)
    }
}
