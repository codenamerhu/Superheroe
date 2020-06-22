//
//  Powerstats.swift
//  SuperHeroes
//
//  Created by SBI Admin on 2020/06/21.
//  Copyright © 2020 Rhulani Ndhlovu. All rights reserved.
//

import Foundation

struct Powerstats {
    var combat: String
    var durability: String
    var intelligence: String
    var power: String
    var strength: String
    var speed: String
    
    init(combat: String, durability: String, intelligence: String, power:String, strength:String, speed: String) {
        self.combat = combat
        self.durability = durability
        self.intelligence = intelligence
        self.power = power
        self.strength = strength
        self.speed = speed
    }
}
