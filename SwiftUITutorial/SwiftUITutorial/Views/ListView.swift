//
//  ListView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

final class ProgrammersModelData: ObservableObject {
    @Published var programmers = [
        Programmer(id: 0, name: "Enrique Solis", languages: "Swift, Kotlin, React Native", avatar: Image("eseg"), favorite: true),
        Programmer(id: 1, name: "Lino Botto", languages: "Swift, React Native, Java", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 2, name: "Damian Fernandez", languages: "PHP, React Native", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 3, name: "Matias Urrutia", languages: "React Native, React JS", avatar: Image(systemName: "person.fill"), favorite: true),
        Programmer(id: 4, name: "Daniel Urra", languages: "React Native, C#", avatar: Image(systemName: "person.fill"), favorite: false)
    ]
}

struct ListView: View {
    
    @EnvironmentObject var programmersModelData: ProgrammersModelData
    
    @State private var showFavorites = false
    
    private var filteredProgrammers: [Programmer] {
        return programmersModelData.programmers.filter { programmer in
            return !showFavorites || programmer.favorite
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showFavorites) {
                    Text("Mostrar favoritos")
                }.padding()
                    List(filteredProgrammers, id: \.id) { programmer in
                        NavigationLink(destination: ListDetailView(programmer: programmer, favorite: $programmersModelData.programmers[programmer.id].favorite)) {
                            RowView(programmer: programmer)
                        }
                    }
            }
            .navigationTitle("Programmers")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(ProgrammersModelData())
    }
}
