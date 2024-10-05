//
//  Date+Extensions.swift
//  TRPDataLayer
//
//  Created by Evren Yaşar on 29.07.2020.
//  Copyright © 2020 Tripian Inc. All rights reserved.
//

import Foundation
extension Date {
    
    /// Date tipindeki veriyi String tipine dönüştürür.
    ///
    /// - Parameter format: Date formatı
    /// - Returns: Date to String
    func toString(format: String? = nil, dateStyle: DateFormatter.Style? = nil, timeStyle: DateFormatter.Style? = nil) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        if let f = format {
            formatter.dateFormat = f
        }
        if let ts = timeStyle {
            formatter.timeStyle = ts
        }
        if let ds = dateStyle   {
            formatter.dateStyle = ds
        }
        return formatter.string(from: self)
    }
    
}
