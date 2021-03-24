//
//  Extensions.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import Foundation

extension Double {
    var round: String {
        let number = Int(self)
        let mark = number > 0 ? "+" : ""
        return mark + "\(number)"
    }
    
    var celsius: String {
        return  self.round + "\u{00B0}"
    }
}

extension Int {
    var hPa: String {
        return  "\(self)" + " hPa"
    }
    
    var percent: String {
        return  "\(self)" + " %"
    }
    
    var hour_: String {
        let date = Date(timeIntervalSinceNow: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH"
        let str = dateFormatter.string(from: date)
        return str + ":00"
    }
    
    var hour: String {
        let date = Date(timeIntervalSinceNow: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    var shortTime: String {
        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let time = dateFormatter.string(from: date)
        return time
    }
    
    var weekDay: String {
        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "d, MMM, E" //EEEE"
        return dateFormatter.string(from: date)
    }
}

extension String {
    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date!)
    }
}

public extension Array where Element: Hashable {
  static func removeDuplicates(_ elements: [Element]) -> [Element] {
    var seen = Set<Element>()
    return elements.filter{ seen.insert($0).inserted }
  }
}
