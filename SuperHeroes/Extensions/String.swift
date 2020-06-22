//
//  String.swift
//  SuperHeroes
//
//  Created by SBI Admin on 2020/06/21.
//  Copyright © 2020 Rhulani Ndhlovu. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
