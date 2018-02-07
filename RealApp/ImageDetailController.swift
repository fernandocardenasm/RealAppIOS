//
//  ImageDetailController.swift
//  RealApp
//
//  Created by Fernando on 07.02.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class ImageDetailController:UIViewController {
    
    var personSelected: Person?
    var digitalSelected: Person?
    
    var imageSelected: String? {
        didSet{
            if let typeImage = imageSelected {
                navigationItem.title = typeImage
            }
        }
    }
    var imageName: String? {
        didSet{
            if let image = imageName {
                otherImage.image = UIImage(named: image)
            }
        }
    }
    
    var logs = [LogData]()
    
    var otherImage:UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.backgroundColor = .yellow
        
        return imageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let savedLogs = Helpers.loadLogs() {
            logs = savedLogs
        }
        
        let stringAux = ";User Selected: \(personSelected?.userName ?? ";None");Other Selected: \(digitalSelected?.userName ?? ";None");imageSelected: \(imageSelected ?? ";None")"
        
        logs.append(LogData(date: Helpers.getCurrentDateTime(), stringData: stringAux)!)
        Helpers.saveLogs(logs: logs)
    }
    
    func setUpViews() {
        view.addSubview(otherImage)
        
        view.addConstrainstWithFormat("H:|[v0]|", views: otherImage)
        
        view.addConstrainstWithFormat("V:|[v0]|", views: otherImage)
        
        //        addConstrainstWithFormat("V:|-16-[v0(30)]-8-[v1(44)]-16-|", views: otherImage, otherName)
        
    }
    
}
