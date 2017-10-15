//
//  ViewController.swift
//  RealApp
//
//  Created by Fernando on 17.09.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var people: [Person] = [Person()]
    
    let personCellId = "personCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        people = SeedData.seedData()
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: personCellId)
        
        navigationItem.title = "Hallo"
        
        
    }
    
    
    func showListController(person: Person, index: Int){
        
        let layout = UICollectionViewFlowLayout()
        
        let listViewController = ListController(collectionViewLayout: layout)
        listViewController.personSelected = person
        listViewController.indexPersonSelected = index
        navigationController?.pushViewController(listViewController, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: personCellId, for: indexPath) as! PersonCell
                
        cell.person = people[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/2) - 20, height: (view.frame.width/2) - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        showListController(person: people[indexPath.item], index: indexPath.item)
        
    }

}

