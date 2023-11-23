//
//  Dummy.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import Foundation

struct Cases : Codable, Hashable {
    var country : String
    var region : String
    var cases : [String: Contagio]
}

struct Contagio : Codable, Hashable {
    var new : Int
    var total : Int
}
