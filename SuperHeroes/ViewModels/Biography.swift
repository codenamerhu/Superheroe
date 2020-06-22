//
//  Biography.swift
//  SuperHeroes
//
//  Created by SBI Admin on 2020/06/21.
//  Copyright © 2020 Rhulani Ndhlovu. All rights reserved.
//

import Foundation

struct Biography {
    var alignment: String
    var fullName: String
    var placeOfBirth: String
    var publisher: String
    
    init(alignment: String, fullName: String, placeOfBirth: String, publisher: String) {
        self.alignment = alignment
        self.fullName = fullName
        self.placeOfBirth = placeOfBirth
        self.publisher = publisher
    }
}
