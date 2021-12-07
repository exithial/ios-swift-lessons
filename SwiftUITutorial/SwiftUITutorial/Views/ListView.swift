//
//  ListView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

private let programmers = [
    Programmer(id: 1, name: "Enrique Solis", languages: "Swift, Kotlin, React Native", avatar: Image(systemName: "person"), favorite: true),
    Programmer(id: 2, name: "Lino Botto", languages: "Swift, React Native, Java", avatar: Image(systemName: "person.fill"), favorite: false),
    Programmer(id: 3, name: "Damian Fernandez", languages: "PHP, React Native", avatar: Image(systemName: "person.fill"), favorite: false),
    Programmer(id: 4, name: "Matias Urrutia", languages: "React Native, React JS", avatar: Image(systemName: "person.fill"), favorite: true),
    Programmer(id: 5, name: "Daniel Urra", languages: "React Native, C#", avatar: Image(systemName: "person.fill"), favorite: false)
]

struct ListView: View {
    
    @State private var showFavorites = false
    
    private var filteredProgrammers: [Programmer] {
        return programmers.filter { programmer in
            return !showFavorites || programmer.favorite
        }
    }
    
    var body: some View {
        VStack {
            Toggle(isOn: $showFavorites) {
                Text("Mostrar favoritos")
            }.padding()
            NavigationView {
                List(filteredProgrammers, id: \.id) { programmer in
                    NavigationLink(destination: ListDetailView(programmer: programmer)) {
                        RowView(programmer: programmer)
                    }
                }
                .navigationTitle("Programmers")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
