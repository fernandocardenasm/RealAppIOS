//
//  SeedData.swift
//  RealApp
//
//  Created by Fernando on 15.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class SeedData {
    
    static var peopleSeed: [Person] = [Person()]
    
    static func seedData() -> [Person]{
        let person1 = Person()
        person1.userId = "1"
        person1.userName = "Carolin"
        person1.imageProfile = "caro_p"
        person1.imageSelf = "caro_s"
        person1.imageFriend = "caro_f"
        person1.listFriends = ["0"]
        
        let person2 = Person()
        person2.userId = "2"
        person2.userName = "Christopher"
        person2.imageProfile = "chris_p"
        person2.imageSelf = "chris_s"
        person2.imageFriend = "chris_f"
        person2.listFriends = ["0"]
        
        let person3 = Person()
        person3.userId = "3"
        person3.userName = "Charlotte"
        person3.imageProfile = "charlotte_p"
        person3.imageSelf = "charlotte_s"
        person3.imageFriend = "charlotte_f"
        person3.listFriends = ["4","5"]
        
        let person4 = Person()
        person4.userId = "4"
        person4.userName = "Svea"
        person4.imageProfile = "svea_p"
        person4.imageSelf = "svea_s"
        person4.imageFriend = "svea_f"
        person4.listFriends = ["3", "5"]
        
        let person5 = Person()
        person5.userId = "5"
        person5.userName = "Michelle"
        person5.imageProfile = "michelle_p"
        person5.imageSelf = "michelle_s"
        person5.imageFriend = "michelle_f"
        person5.listFriends = ["3", "4"]
        
        
        return [person1, person2, person3, person4, person5]
        
    }
    
}
