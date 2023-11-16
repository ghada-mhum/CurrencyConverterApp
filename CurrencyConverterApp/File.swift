//
//  File.swift
//  CurrencyConverterApp
//
//  Created by ghada Mohammad on 30/04/1445 AH.
//

import Foundation

extension String{
    
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double{
        String.numberFormatter.decimalSeparator = ","
        if let result = String.numberFormatter.number(from: self){
            return result.doubleValue
            
        }else{
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self){
                return result.doubleValue
            }
        }
       return 0
    }
}
