//
//  Dummy.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import Foundation

struct Cases : Codable {
    var country : String
    var region : String
    var cases : [String: [String : Int]]
}

