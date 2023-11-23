//
//  ContentViewCard.swift
//  Pre
//
//  Created by Armando Rosas Balderas on 22/11/23.
//

import SwiftUI
import SDWebImageSwiftUI



struct ContentViewCard: View {
    @Environment(\.colorScheme) private var colorScheme
    let cases : Cases
    
    
    var body: some View {
        VStack {
         /*   VStack (spacing: 0) {
                HStack {
                    Text(movie.original_title)
                        .font(.title2).bold()
                    Spacer()
                }
               
                Spacer().frame(height: 15)
                Text(movie.overview).padding([.bottom], 12)
                
                WebImage(url: URL(string: "\(image)\(movie.poster_path)"))
                    .resizable()
                    .cornerRadius(4)
                    .scaledToFit()
                
                }
                HStack {
                    Image(systemName: "hand.thumbsup.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .padding(.top, 4)
                        
                    
                    Text(String(movie.vote_average))
                        .padding(.top, 4)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .padding(.bottom, 4)
                
                Divider()
                    .frame(height: 0.5)
                    .overlay(.gray)

                
                HStack {
                    HStack{
                        Button {
                           print("Like")
                        } label : {
                            Image(systemName: "hand.thumbsup")
                                .tint(colorScheme == .dark ? .white : .black)
                            Text("Me gusta").foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button {
                           print("Comentar")
                        } label : {
                            Image(systemName: "bubble.right")
                                .tint(colorScheme == .dark ? .white : .black)
                            Text("Comentar").foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                    }
                    
                }
                .padding(.top, 8)
                
              */
            }
            .padding()
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            ).padding(10)
        }
}


//struct ContentViewCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewCard()
//    }
//}
