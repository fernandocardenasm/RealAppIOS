//
//  OtherCell.swift
//  RealApp
//
//  Created by Fernando on 17.09.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class OtherCell:BaseCell {
    
    let otherImage:UIView = {
        
        let imageView = UIView()
        imageView.backgroundColor = .yellow
        
        return imageView
        
    }()
    
    let otherName:UITextView = {
        
        let nameView = UITextView()
        nameView.backgroundColor = .blue
        nameView.text = "Alejandra"
        
        return nameView
        
    }()
    
    override func setUpViews() {
        addSubview(otherImage)
        addSubview(otherName)
        
        addConstrainstWithFormat("H:|[v0]|", views: otherImage)
        addConstrainstWithFormat("H:|[v0]|", views: otherName)
        
        addConstrainstWithFormat("V:|-14-[v0]-8-[v1(30)]|", views: otherImage, otherName)
        
//        addConstrainstWithFormat("V:|-16-[v0(30)]-8-[v1(44)]-16-|", views: otherImage, otherName)
        
    }
    
    
}
