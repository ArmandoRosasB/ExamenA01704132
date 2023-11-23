//
//  NetworkAPIService.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//


import Foundation
import Alamofire

class NetWorkAPIService {
    static let shared = NetWorkAPIService() // Patron de diseño Singleton
    
    func getCases(url: URL)async -> [Cases]? {
        let parameters : Parameters = [ // El pais del cual queremos obtener informacion
            "country" :  "canada"
        ]
        let headers: HTTPHeaders = [ // Api Key
                "X-Api-Key": "wLVPN1zV08lJYF7uXqgyPw==zVwp6TlVcAO1NLUf"
            ]
        
        // Hacer el request y validar que haya sido exitoso
        let task_request = AF.request(url, method: .get, parameters: parameters, headers: headers).validate()
        
        // Guardar la respuesta
        let response = await task_request.serializingData().response
        switch response.result {
        case let .success(data):
            do {
                return try JSONDecoder().decode([Cases].self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
            
        }
    }
    
}


