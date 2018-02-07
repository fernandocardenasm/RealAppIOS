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
        
        collectionView?.backgroundColor = .white
        
        
        
        if personSelected?.userId == digitalSelected?.userId {
            self.navigationItem.title = "Show them my"
        }
        else {
            self.navigationItem.title = "See more from"
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let savedLogs = Helpers.loadLogs() {
            logs = savedLogs
        }
        
        let stringAux = ";User Selected: \(personSelected?.userName ?? ";None");Other Selected: \(digitalSelected?.userName ?? ";None")"
        
        logs.append(LogData(date: Helpers.getCurrentDateTime(), stringData: stringAux)!)
        Helpers.saveLogs(logs: logs)
        
    }
    
    func showImageDetail(imageSelected: String, imageName: String){
        let controller = ImageDetailController()
        controller.personSelected = personSelected
        controller.digitalSelected = digitalSelected
        controller.imageSelected = imageSelected
        controller.imageName = imageName
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func isAFriend() -> Bool{
        return (personSelected?.listFriends.contains((digitalSelected?.userId)!))!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if personSelected?.userId == digitalSelected?.userId {
            return 1
        }
        else {
            if isAFriend() {
                return 2
            }
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: digitalCellId, for: indexPath) as! DigitalSelfCell
        
        if personSelected?.userId == digitalSelected?.userId {
            cell.digitalImage = digitalSelected?.imageFriend
            cell.imageDes = "Personal Updates"
        }
        else {
            if isAFriend(){
                if indexPath.item == 0 {
                    cell.digitalImage = digitalSelected?.imageSelf
                    cell.imageDes = "Digital Self"
                }
                else {
                    cell.digitalImage = digitalSelected?.imageFriend
                    cell.imageDes = "Personal Updates"
                }
            }
            else {
                cell.digitalImage = digitalSelected?.imageSelf
                cell.imageDes = "Digital Self"
            }
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/2) - 20, height: (view.frame.width/2) - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if personSelected?.userId == digitalSelected?.userId {
            showImageDetail(imageSelected: "Personal Updates", imageName: (digitalSelected?.imageFriend)! )
        }
        else {
            if isAFriend(){
                if indexPath.item == 0 {
                    showImageDetail(imageSelected: "Digital Self", imageName: (digitalSelected?.imageSelf)!)
                }
                else {
                    showImageDetail(imageSelected: "Personal Updates", imageName: (digitalSelected?.imageFriend)!)
                }
            }
            else {
                showImageDetail(imageSelected: "Digital Self", imageName: (digitalSelected?.imageSelf)!)
            }
        }
        
        
    }
    
    
}
