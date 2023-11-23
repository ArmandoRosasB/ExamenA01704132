//
//  Dummy.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import Foundation

struct Cases : Codable, Hashable { // Modelo de los casos
    var country : String
    var region : String
    var cases : [String: Contagio]
}

struct Contagio : Codable, Hashable { // Modelo que tiene informacion de los contagios
    var new : Int
    var total : Int
}
