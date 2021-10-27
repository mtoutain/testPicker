//
//  Alphabet.swift
//  
//
//  Created by Mitch Toutain on 2021-10-19.
//

import Foundation

class Alphabet {
    
    struct Letter: Identifiable, Equatable {
        var id: Int
        var value: String
    }
    
    static var letters = [
        Letter(id: 1, value: "A"),
        Letter(id: 2, value: "B"),
        Letter(id: 3, value: "C"),
        Letter(id: 4, value: "D"),
        Letter(id: 5, value: "E"),
        Letter(id: 6, value: "F"),
        Letter(id: 7, value: "G"),
        Letter(id: 8, value: "H"),
        Letter(id: 9, value: "I"),
        Letter(id: 10, value: "J"),
        Letter(id: 11, value: "K"),
        Letter(id: 12, value: "L"),
        Letter(id: 13, value: "M"),
        Letter(id: 14, value: "N"),
        Letter(id: 15, value: "O"),
        Letter(id: 16, value: "P"),
        Letter(id: 17, value: "Q"),
        Letter(id: 18, value: "R"),
        Letter(id: 19, value: "S"),
        Letter(id: 20, value: "T"),
        Letter(id: 21, value: "U"),
        Letter(id: 22, value: "V"),
        Letter(id: 23, value: "W"),
        Letter(id: 24, value: "X"),
        Letter(id: 25, value: "Y"),
        Letter(id: 26, value: "Z")
    ]
    
}
