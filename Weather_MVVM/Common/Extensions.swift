//
//  Extensions.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import Foundation

extension Double {
    
    var round: String {
        let number = Int(self)
        return "\(number)"
    }
    
    var celsius: String {
        return  self.round + "\u{00B0}"
    }
    
    var hPa: String {
        return  self.round + " hPa"
    }
    
    var percent: String {
        return  self.round + " %"
    }
}

extension String {
    
    var hour: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateFormatter.dateFromString(self)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.stringFromDate(date!)
    }
    
    var shortTime: String {
        if let interval : NSTimeInterval = NSTimeInterval(self) {
            let date = NSDate(timeIntervalSince1970: interval)
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.AMSymbol = "AM"
            dateFormatter.PMSymbol = "PM"
            let time = dateFormatter.stringFromDate(date)
            return time
        }
        
        return ""
    }
    
    var weekDay: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.dateFromString(self)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.stringFromDate(date!)
    }
    
}