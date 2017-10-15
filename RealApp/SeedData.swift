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
        person1.userName = "Fernando"
        person1.imageProfile = "person1_p"
        person1.imageSelf = "person1_s"
        person1.imageFriend = "person1_f"
        person1.listFriends = ["2"]
        
        let person2 = Person()
        person2.userId = "2"
        person2.userName = "Maria"
        person2.imageProfile = "person2_p"
        person2.imageSelf = "person2_s"
        person2.imageFriend = "person2_f"
        person2.listFriends = ["1"]
        
        let person3 = Person()
        person3.userId = "3"
        person3.userName = "Led"
        person3.imageProfile = "person3_p"
        person3.imageSelf = "person3_s"
        person3.imageFriend = "person3_f"
        person3.listFriends = ["0"]
        
        return [person1, person2, person3]
        
    }
    
}
