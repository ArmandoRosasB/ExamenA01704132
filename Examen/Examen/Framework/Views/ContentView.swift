//
//  ContentView.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import SwiftUI

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
                   /* ForEach(content_view_model.case_list){cases in
                        ContentViewCard(cases : cases)
                    }*/
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
