//
//  Card.swift
//  Conectration_Project
//
//  Created by Fernando Benavides Rodriguez on 3/31/18.
//  Copyright © 2018 Fernando Benavides. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = true
    var isMatched = false
    var id: Int
    var atLeastOneTimeFaceUp = false

    init(id: Int) {
        self.id = id
    }

}
