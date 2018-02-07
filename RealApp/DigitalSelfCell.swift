//
//  DigitalSelfCell.swift
//  RealApp
//
//  Created by Fernando on 15.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class DigitalSelfCell:BaseCell {
    
    var digitalImage: String? {
        didSet{
            
            if let profile = digitalImage {
                otherImage.image = UIImage(named: profile)
            }
            
        }
    }
    
    var imageDes: String? {
        didSet{
            if let imageDes = imageDes {
                imageDescription.text = imageDes
                imageDescription.font = .boldSystemFont(ofSize: 16)
            }
        }
    }
    
    var otherImage:UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.backgroundColor = .yellow
        imageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    let imageDescription:UITextView = {
        
        let textView = UITextView()
        //        nameView.backgroundColor = .blue
        textView.text = "Alejandra"
        
        textView.textAlignment = .center
        textView.font = .boldSystemFont(ofSize: 24)
        
        return textView
        
    }()
    
    
    override func setUpViews() {
        addSubview(otherImage)
        addSubview(imageDescription)
        
        addConstrainstWithFormat("H:|-20-[v0(160)]|", views: otherImage)
        addConstrainstWithFormat("H:|[v0]|", views: imageDescription)
        
//        addConstrainstWithFormat("V:|-20-[v0(160)]|", views: otherImage)
        
        addConstrainstWithFormat("V:|-14-[v0]-8-[v1(36)]|", views: otherImage, imageDescription)
        
        //        addConstrainstWithFormat("V:|-16-[v0(30)]-8-[v1(44)]-16-|", views: otherImage, otherName)
        
    }
    
    
}
