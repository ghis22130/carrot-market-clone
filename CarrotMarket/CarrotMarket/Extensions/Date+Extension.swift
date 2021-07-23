//
//  Date+Extension.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/22.
//

import Foundation

extension Date {
    
    func intervalNow() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
}
