//
//  Helpers.swift
//  RealApp
//
//  Created by Fernando on 25.10.17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import Foundation
import os.log

class Helpers {
    
    static func getCurrentDateTime() -> String {
        let date = Date()
        let newDate = "\(date)"
        return newDate
    }
    
    static func saveLogs(logs: [LogData]) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(logs, toFile: LogData.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Logs successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save logs...", log: OSLog.default, type: .error)
        }
    }
    
    static func loadLogs() -> [LogData]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: LogData.ArchiveURL.path) as? [LogData]
    }
    
    static func printLogs(logs: [LogData]) {
        for log in logs {
            print("date: \(log.date) data: \(log.stringData)")
        }
    }
    
    static func getStringFromData(logs: [LogData]) -> String {
        
        var stringAux = ""
        
        for log in logs {
            stringAux += " \(log.date);\(log.stringData)"
        }
        
        return stringAux
        
    }
}


