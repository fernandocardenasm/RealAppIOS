//
//  DigitalSelfController.swift
//  RealApp
//
//  Created by Fernando on 15.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class DigitalSelfController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    let digitalCellId = "digitalCellId"

    var personSelected: Person?
    var digitalSelected: Person?
    
    var logs = [LogData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(DigitalSelfCell.self, forCellWithReuseIdentifier: digitalCellId)
        
        if let savedLogs = Helpers.loadLogs() {
            logs = savedLogs
        }
        
        let stringAux = ";User Selected: \(personSelected?.userName ?? ";None");Other Selected: \(digitalSelected?.userName ?? ";None")"
        
        logs.append(LogData(date: Helpers.getCurrentDateTime(), stringData: stringAux)!)
        Helpers.saveLogs(logs: logs)
    
    }
    
    func isAFriend() -> Bool{
        return (personSelected?.listFriends.contains((digitalSelected?.userId)!))!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isAFriend() {
            return 2
        }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: digitalCellId, for: indexPath) as! DigitalSelfCell
        
        if isAFriend(){
            if indexPath.item == 0 {
                cell.digitalImage = digitalSelected?.imageFriend
            }
            else {
                cell.digitalImage = digitalSelected?.imageSelf
            }
        }
        else {
            cell.digitalImage = digitalSelected?.imageSelf
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    
}
