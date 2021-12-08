//
//  StateView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var name = "ESEG"
    @Published var age = 27
}

struct StateView: View {
    
    @State private var value = 0
    @State private var selection: Int?
    @StateObject private var user = UserData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("El valor actual es \(value)")
                Button("Suma 1") {
                    value += 1
                }
                Text("Mi nombre es \(user.name) y mi edad es \(user.age)")
                Button("Actualizar datos") {
                    user.name = "Enrique Solis"
                    user.age = 28
                }
                NavigationLink(destination: BindingView(value: $value, user: user), tag: 1, selection: $selection) {
                    Button("Ir a BindingView") {
                        selection = 1
                    }
                }
            }
            .navigationTitle("StateView")
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
            .environmentObject(UserData())
    }
}
