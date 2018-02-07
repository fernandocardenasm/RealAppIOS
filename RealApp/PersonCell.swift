//
//  OtherCell.swift
//  RealApp
//
//  Created by Fernando on 17.09.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class PersonCell:BaseCell {
    
    var person: Person? {
        didSet{
            
            if let profile = person?.imageProfile {
                otherImage.image = UIImage(named: profile)
            }
            
            if let name = person?.userName {
                otherName.text = name
            }
        }
    }
    
    var type: String? {
        didSet {
            if let type = type {
                if type == "friend" {
                    otherName.backgroundColor = .yellow
                }
                else if type == "itself" {
                    otherName.backgroundColor = .green
                    otherName.font = .boldSystemFont(ofSize: 16)
                    otherName.text = "Show them yourself ;)"
                }
            }
        }
    }
    
    
    var otherImage:UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.backgroundColor = .yellow
        
        return imageView
        
    }()
    
    let otherName:UITextView = {
        
        let nameView = UITextView()
//        nameView.backgroundColor = .blue
        nameView.text = "Alejandra"
        
        nameView.textAlignment = .center
        nameView.font = .boldSystemFont(ofSize: 24)
        
        return nameView
        
    }()
    
    override func setUpViews() {
        addSubview(otherImage)
        addSubview(otherName)
        
        addConstrainstWithFormat("H:|[v0]|", views: otherImage)
        addConstrainstWithFormat("H:|[v0]|", views: otherName)
        
        addConstrainstWithFormat("V:|-14-[v0]-8-[v1(36)]|", views: otherImage, otherName)
        
//        addConstrainstWithFormat("V:|-16-[v0(30)]-8-[v1(44)]-16-|", views: otherImage, otherName)
        
    }
    
    
}
