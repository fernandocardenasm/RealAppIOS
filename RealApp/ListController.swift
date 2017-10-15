//
//  ListController.swift
//  RealApp
//
//  Created by Fernando on 15.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class ListController: UICollectionViewController {
    
    var people: [Person] = [Person()]
    var personSelected: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        people = SeedData.seedData()
        
        collectionView?.backgroundColor = .blue
        
    }

}
