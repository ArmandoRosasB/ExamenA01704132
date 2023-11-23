//
//  DummyRequirement.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import Foundation

protocol CaseListRequirementProtocol {
    func get_case_list() async -> [Cases]?
    
}

class CaseListRequirement: CaseListRequirementProtocol {
    
    static let shared = CaseListRequirement() // Patron de diseño Singleton
    
    let data_repository: CasesRepository
    
    init(data_repository: CasesRepository = CasesRepository.shared) {
        self.data_repository = data_repository
    }
    
    func get_case_list() async -> [Cases]? { // Esta funcion nos regresa una lista de Cases
        return await data_repository.get_cases_list()
    }
}
