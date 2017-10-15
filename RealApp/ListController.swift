//
//  ListController.swift
//  RealApp
//
//  Created by Fernando on 15.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class ListController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    let personCellId = "personCellId"
    
    var people: [Person] = [Person()]
    var personSelected: Person?
    var indexPersonSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        people = SeedData.seedData()
        
        people.remove(at: indexPersonSelected!)
        
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: personCellId)
        
        collectionView?.backgroundColor = .white
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        lpgr.minimumPressDuration = 0.8
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        collectionView?.addGestureRecognizer(lpgr)
        
    }
    
    func isAFriend(other: Person) -> Bool{
        return (personSelected?.listFriends.contains((other.userId)))!
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizerState.began {
            return
        }
        
        let p = gestureReconizer.location(in: self.collectionView)
        let indexPath = self.collectionView?.indexPathForItem(at: p)
        
        if let index = indexPath {
            _ = self.collectionView?.cellForItem(at: index)
            // do stuff with your cell, for example print the indexPath
            print("Row: \(index.row)")
            
//            if isAFriend(other: people[(indexPath?.item)!]) {
//                let i = personSelected?.listFriends.index(of: people[(indexPath?.item)!].userId)
//                personSelected?.listFriends.remove(at: i!)
//            }
//            else {
//                personSelected?.listFriends.append(people[(indexPath?.item)!].userId)
//            }
//            collectionView?.reloadData()
            
        } else {
            print("Could not find index path")
        }
    }
    
    func showDigitalSelfController(person: Person){
        
        let layout = UICollectionViewFlowLayout()
        
        let digitalViewController = DigitalSelfController(collectionViewLayout: layout)
        digitalViewController.personSelected = self.personSelected
        digitalViewController.digitalSelected = person
        navigationController?.pushViewController(digitalViewController, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: personCellId, for: indexPath) as! PersonCell
        
        if isAFriend(other: people[indexPath.item]) {
            cell.isFriend = true
        }
        else{
            cell.isFriend = false
        }
        
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
        
        showDigitalSelfController(person: people[indexPath.item])
        
    }

}
