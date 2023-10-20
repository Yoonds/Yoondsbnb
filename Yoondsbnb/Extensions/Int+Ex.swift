//
//  Int+Ex.swift
//  Yoondsbnb
//
//  Created by YoonDaesung on 2023/10/20.
//

import Foundation

extension Int {
    
    func formatPrice() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) else { return String(self) } // FIXME: 오류 정의 필요
        return formattedNumber
    }
    
}
