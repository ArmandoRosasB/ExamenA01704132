//
//  DummyRepository.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//


import Foundation

struct Api { // Rutas
    static let base: String = "https://api.api-ninjas.com/v1/covid19"
    
}

protocol CasesAPIProtocol {

    func get_cases_list () async -> [Cases]?
    
    
}

class CasesRepository: CasesAPIProtocol {
    static let shared = CasesRepository() // Patron de diseño Singleton
    
    let n_service: NetWorkAPIService
    init(n_service: NetWorkAPIService = NetWorkAPIService.shared){
        self.n_service = n_service
    }
    
    func get_cases_list() async -> [Cases]? { // Llamamos al network ApiService
        return await n_service.getCases(url: URL(string: "\(Api.base)")!)
    }
    
}

