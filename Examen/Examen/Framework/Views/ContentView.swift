//
//  ContentView.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    @StateObject var content_view_model = CaseViewModel()
    
    var body: some View {
        VStack {
            if content_view_model.case_list.isEmpty {
                Spacer()
                Text("Cargando...")
                Spacer()
            } else {
                ScrollView {
                    ForEach(content_view_model.case_list, id:\.self){cases in
                        Text("\(cases.country)").font(.title).bold()
                        if cases.region == "" {
                            Text("Sin region especifica").font(.title3).bold()
                        } else {
                            Text("\(cases.region)").font(.title3).bold()
                        }
                        
                        
                        Chart(content_view_model.daily_cases, id:\.self) { daily in
                            BarMark(x : .value("Fecha", daily.fecha),
                                    y : .value("Contagios", daily.contagios))
                        }
                        VStack{
                            HStack {
                                Text("Fecha de inicio: \(content_view_model.daily_cases[0].fecha)")
                                Spacer()
                                
                                Text("Fecha de fin: \(content_view_model.daily_cases[content_view_model.daily_cases.count - 1].fecha)")
                            }
                            
                            Spacer()
                            
                            HStack {
                                Text("Cantidad minima de contagios registrados: \(content_view_model.min_val)")
                                Spacer()
                            }
                            HStack {
                                Text("Cantidad maxima de contagios registrados: \(content_view_model.max_val)")
                                Spacer()
                            }
                            
                        }
                        Spacer()
                        }
                
                    }
                }
            }.onAppear{
                Task {
                    await content_view_model.get_case_list()
                }
        }
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
