//
//  ListController.swift
//  RealApp
//
//  Created by Fernando on 15.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import MessageUI

class ListController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate{
    
    let personCellId = "personCellId"
    
    var people: [Person] = [Person()]
    var personSelected: Person?
    var indexPersonSelected: Int?
    
    var logs = [LogData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        people = SeedData.seedData()
        
        people.remove(at: indexPersonSelected!)
        
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: personCellId)
        
        collectionView?.backgroundColor = .white
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        if let savedLogs = Helpers.loadLogs() {
            logs = savedLogs
        }
        
        logs.append(LogData(date: Helpers.getCurrentDateTime(), stringData: "User Selected: \(personSelected?.userName ?? "None")")!)
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
