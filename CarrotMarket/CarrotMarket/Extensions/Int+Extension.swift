//
//  Int+Extension.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/23.
//

import Foundation

extension Int {
    
    func currencyKR() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let numberString = (formatter.string(for: self) ?? "") + "원"
        
        return numberString
    }
    
}
