//
//  ListDetailView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

struct ListDetailView: View {
    
    var programmer: Programmer
    @Binding var favorite: Bool
    
    var body: some View {
        VStack {
            programmer.avatar
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.black, lineWidth: 4)
                )
                .shadow(color: Color.gray, radius: 5)
            HStack {
                Text(programmer.name)
                    .font(.largeTitle)
                Button {
                    favorite.toggle()
                } label: {
                    if favorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)

                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.black)

                    }
                }
            }
            Text(programmer.languages)
                .font(.title)
            Spacer()
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(programmer: Programmer(
            id: 1,
            name: "Enrique Solis",
            languages: "Swift, Kotlin, React Native",
            avatar: Image(systemName: "person.fill"),
            favorite: true
        ), favorite: .constant(false))
    }
}
