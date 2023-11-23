//
//  DummyViewModel.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import Foundation

class CaseViewModel : ObservableObject { // Patron de diseño observer
    @Published var case_list = [Cases]() // Notificar cambios al ContentView
    
    var case_list_requirement: CaseListRequirementProtocol
 
    init(case_list_requirement: CaseListRequirementProtocol = CaseListRequirement.shared) {
        self.case_list_requirement = case_list_requirement
    }
    
    @MainActor
    func get_case_list() async {
        
        let result = await case_list_requirement.get_case_list()
        print(result!.count)
        for i in 0...result!.count - 1 {
            print(result![i])
         /*   let temp_movie = Movie(id: Int(result!.results[i].id), original_title: result!.results[i].original_title, overview: result!.results[i].overview, poster_path: result!.results[i].poster_path, vote_average: result!.results[i].vote_average)
            
           self.movie_list.append(temp_movie)*/
        }
        
    }
}
