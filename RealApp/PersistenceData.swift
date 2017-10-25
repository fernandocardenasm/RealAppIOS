//
//  PersistenceData.swift
//  RealApp
//
//  Created by Fernando on 25.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import Foundation
import os.log

class LogData: NSObject, NSCoding {
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("logdata")
    
    //MARK: Properties
    
    var date: String
    var stringData: String
    
    struct PropertyKey {
        
        static let date = "date"
        static let stringData = "stringData"
        
    }
    
    init?(date: String, stringData: String){
        // The name must not be empty
        guard !date.isEmpty else {
            return nil
        }
        
        guard !stringData.isEmpty else {
            return nil
        }
        
        self.date = date
        self.stringData = stringData
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(stringData, forKey: "stringData")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let date = aDecoder.decodeObject(forKey: PropertyKey.date) as? String else {
            os_log("Unable to decode the date for a LogData object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let stringData = aDecoder.decodeObject(forKey: PropertyKey.stringData) as? String else {
            os_log("Unable to decode the stringData for a LogData object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(date: date, stringData: stringData)
        
    }
    
    
    
}
