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
        person1.userName = "Claudia"
        person1.imageProfile = "claudia_p"
        person1.imageSelf = "claudia_s"
        person1.imageFriend = "claudia_f"
        person1.listFriends = ["0"]
        
        let person2 = Person()
        person2.userId = "2"
        person2.userName = "Mark"
        person2.imageProfile = "mark_p"
        person2.imageSelf = "mark_s"
        person2.imageFriend = "mark_f"
        person2.listFriends = ["3"]
        
        let person3 = Person()
        person3.userId = "3"
        person3.userName = "Gabriela"
        person3.imageProfile = "gabriela_p"
        person3.imageSelf = "gabriela_s"
        person3.imageFriend = "gabriela_f"
        person3.listFriends = ["2", "4"]
        
        let person4 = Person()
        person4.userId = "4"
        person4.userName = "Emilio"
        person4.imageProfile = "emilio_p"
        person4.imageSelf = "emilio_s"
        person4.imageFriend = "emilio_f"
        person4.listFriends = ["3"]
        
        let person5 = Person()
        person5.userId = "5"
        person5.userName = "Djanina"
        person5.imageProfile = "dj_p"
        person5.imageSelf = "dj_s"
        person5.imageFriend = "dj_s"
        person5.listFriends = ["0"]
        
        let person6 = Person()
        person6.userId = "6"
        person6.userName = "Rana"
        person6.imageProfile = "rana_p"
        person6.imageSelf = "rana_s"
        person6.imageFriend = "rana_s"
        person6.listFriends = ["0"]
        
        
        return [person1, person2, person3, person4, person5, person6]
        
    }
    
}
