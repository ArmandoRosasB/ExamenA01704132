//
//  DummyViewModel.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import Foundation

struct Contagios : Hashable{
    var fecha : String
    var contagios : Int
}

class CaseViewModel : ObservableObject { // Patron de diseño observer
    @Published var case_list = [Cases]() // Notificar cambios al ContentView
    @Published var daily_cases =  [Contagios]()
    
    var case_list_requirement: CaseListRequirementProtocol
 
    init(case_list_requirement: CaseListRequirementProtocol = CaseListRequirement.shared) {
        self.case_list_requirement = case_list_requirement
    }
    
    @MainActor
    func get_case_list() async {
        
        let result = await case_list_requirement.get_case_list()
        for i in 0...result!.count - 1 {

            let temp_case = Cases(country: result![i].country, region: result![i].region, cases: result![i].cases)
            
            for(key, value) in result![i].cases {
                daily_cases.append(.init(fecha: key, contagios: value.total))
            }
            
            self.case_list.append(temp_case)
        }
        
        
    }
}
