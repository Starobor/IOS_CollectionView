//
//  DetailViewController.swift
//  ColectionView
//
//  Created by Citizen on 9/18/18.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! {
        didSet{
            guard let image = menu?.imageName else {return}
            imageView.image = UIImage(named: image)
        }
    }
    @IBOutlet weak var nameLabel: UILabel!{
        didSet {
            nameLabel.text = menu?.name
        }
    }
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}
