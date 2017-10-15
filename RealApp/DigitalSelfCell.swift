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
    
    var otherImage:UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.backgroundColor = .yellow
        
        return imageView
        
    }()
    
    
    override func setUpViews() {
        addSubview(otherImage)
        
        addConstrainstWithFormat("H:|[v0]|", views: otherImage)
        addConstrainstWithFormat("V:|[v0]|", views: otherImage)
        
        //        addConstrainstWithFormat("V:|-16-[v0(30)]-8-[v1(44)]-16-|", views: otherImage, otherName)
        
    }
    
    
}
