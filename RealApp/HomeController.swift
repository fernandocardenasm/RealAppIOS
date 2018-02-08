//
//  ViewController.swift
//  RealApp
//
//  Created by Fernando on 17.09.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import os.log

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    var people: [Person] = [Person()]
    
    var logs = [LogData]()
    
    let personCellId = "personCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        people = SeedData.seedData()
        
        collectionView?.backgroundColor = .white
        self.navigationItem.title = "Who are you?"
        
        
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: personCellId)
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        lpgr.minimumPressDuration = 2
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        collectionView?.addGestureRecognizer(lpgr)
        
//        loadSampleLogs()
//        saveLogs()
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
//        let newDate = dateFormatter.string(from: date)
        
        
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizerState.began {
            return
        }
        print("Starts here-----------------------------------")
        print(Helpers.getStringFromData(logs: logs))
        
        
        //            let p = gestureReconizer.location(in: self.collectionView)
        //            let indexPath = self.collectionView?.indexPathForItem(at: p)
        //
        //            if let index = indexPath {
        //                _ = self.collectionView?.cellForItem(at: index)
        //                // do stuff with your cell, for example print the indexPath
        //                print("Row: \(index.row)")
        //
        //                //            if isAFriend(other: people[(indexPath?.item)!]) {
        //                //                let i = personSelected?.listFriends.index(of: people[(indexPath?.item)!].userId)
        //                //                personSelected?.listFriends.remove(at: i!)
        //                //            }
        //                //            else {
        //                //                personSelected?.listFriends.append(people[(indexPath?.item)!].userId)
        //                //            }
        //                //            collectionView?.reloadData()
        //
        //            } else {
        //                print("Could not find index path")
        //            }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let savedLogs = Helpers.loadLogs() {
            logs = savedLogs
        }
        Helpers.printLogs(logs: logs)
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
        
        let alert = UIAlertController(title: "Are you \(people[indexPath.item].userName)?", message: "It's recommended that you select only yourself.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.showListController(person: self.people[indexPath.item], index: indexPath.item)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    
        
    }
    
    //MARK: Private Methods
    
//    private func loadSampleLogs() {
//
//        guard let logdata1 = LogData(date: "June", stringData: "Maria") else {
//            fatalError("Unable to instantiate meal1")
//        }
//
//        guard let logdata2 = LogData(date: "August", stringData: "Rocio") else {
//            fatalError("Unable to instantiate meal2")
//        }
//
//        logs += [logdata1, logdata2]
//    }
    

}

