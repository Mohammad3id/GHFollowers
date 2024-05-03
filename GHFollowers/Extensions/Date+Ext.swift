//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 18/04/2024.
//

import Foundation

extension Date {
    
    var monthYearFormat: String {
        return formatted(.dateTime.month().year())
    }
    
}
