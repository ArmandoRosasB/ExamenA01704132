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
    @Published var max_val = 0
    @Published var min_val = 10000000000
    
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
                if max_val < value.total {
                    max_val = value.total
                }
                
                if min_val > value.total {
                    min_val = value.total
                }
                
            }
            daily_cases = daily_cases.sorted(by: { $0.fecha < $1.fecha })
            self.case_list.append(temp_case)
        }
        
        
    }
}
