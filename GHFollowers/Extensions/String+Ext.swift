//
//  String+Ext.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 18/04/2024.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        return self.convertToDate()?.monthYearFormat ?? "N/A"
    }
}
