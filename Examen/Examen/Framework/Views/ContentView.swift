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
                Text("Cargando")
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
                        
                    }
                    }
                }
            } .onAppear{
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
