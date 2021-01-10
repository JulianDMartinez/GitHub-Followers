//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by Julian Martinez on 1/9/21.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
