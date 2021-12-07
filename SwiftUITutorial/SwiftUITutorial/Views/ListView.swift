//
//  ListView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

private let programmers = [
    Programmer(id: 1, name: "Enrique Solis", languages: "Swift, Kotlin, React Native", avatar: Image(systemName: "person.fill")),
    Programmer(id: 2, name: "Lino Botto", languages: "Swift, React Native, Java", avatar: Image(systemName: "person.fill")),
    Programmer(id: 3, name: "Damian Fernandez", languages: "PHP, React Native", avatar: Image(systemName: "person.fill")),
    Programmer(id: 4, name: "Matias Urrutia", languages: "React Native, React JS", avatar: Image(systemName: "person.fill")),
    Programmer(id: 5, name: "Daniel Urra", languages: "React Native, C#", avatar: Image(systemName: "person.fill"))
]

struct ListView: View {
    var body: some View {
        List(programmers, id: \.id) { programmer in
            RowView(programmer: programmer)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
