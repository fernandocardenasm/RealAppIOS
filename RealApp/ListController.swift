//
//  ListController.swift
//  RealApp
//
//  Created by Fernando on 15.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import MessageUI
import Firebase

class ListController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate{
    
    let personCellId = "personCellId"
    
    var people: [Person] = [Person()]
    var personSelected: Person?
    var indexPersonSelected: Int?
    
    var logs = [LogData]()
    
    var isAlone = false
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "I would like to see more from"
        
        people = SeedData.seedData()
        
        if let isAlone = personSelected?.listFriends.contains("0") {
            if !isAlone {
                people.remove(at: indexPersonSelected!)
                self.isAlone = false
            }
            else {
                self.isAlone = true
            }
        }
        
        
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: personCellId)
        
        collectionView?.backgroundColor = .white
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        lpgr.minimumPressDuration = 2
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        collectionView?.addGestureRecognizer(lpgr)
        
        ref = Database.database().reference()
        
    }

    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizerState.began {
            return
        }
        print("Starts here-----------------------------------")
        
        let refChild = ref.childByAutoId()
        
        let str = "iOS------Final User: \(personSelected?.userName ?? "None"); \(Helpers.getStringFromData(logs: logs))"
        
        refChild.setValue(str)
        
        // toast with a specific duration and position
        self.view.makeToast("Your message was sent!", duration: 3.0, position: .center)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let savedLogs = Helpers.loadLogs() {
            logs = savedLogs
        }
        
        logs.append(LogData(date: Helpers.getCurrentDateTime(), stringData: ";User Selected: \(personSelected?.userName ?? ";None")")!)
        Helpers.saveLogs(logs: logs)
        
    }
    
    func isAFriend(other: Person) -> Bool{
        return (personSelected?.listFriends.contains((other.userId)))!
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
        
        cell.person = people[indexPath.item]
        
        if isAFriend(other: people[indexPath.item]) {
            cell.type = "friend"
        }
        else{
            if self.isAlone && people[indexPath.item].userId == personSelected?.userId {
                cell.type = "itself"
            }
        }
        
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
    
    func createTextfile(){
        let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        let fileurl =  dir.appendingPathComponent("logM.txt")
        
        let data = Helpers.getStringFromData(logs: logs).data(using: .utf8, allowLossyConversion: false)!
        
        
        if FileManager.default.fileExists(atPath: fileurl.path) {
            if let fileHandle = try? FileHandle(forUpdating: fileurl) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
                print("Created successfully")
            }
        } else {
            try! data.write(to: fileurl, options: Data.WritingOptions.atomic)
        }
    }

}
