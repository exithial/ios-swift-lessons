//
//  BindingView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

struct BindingView: View {
    
    @Binding var value: Int
    @ObservedObject var user: UserData
    @State private var selection: Int?
    
    var body: some View {
        VStack {
            Button("Suma 2") {
                value += 2
            }
            Button("Actualizar datos") {
                user.name = "ESEG by Enrique Solis"
                user.age = 29
            }
            NavigationLink(destination: EnvironmentView(), tag: 1, selection: $selection) {
                Button("Ir a EnvironmentView") {
                    selection = 1
                }
            }
        }
    }
    
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView(value: .constant(5), user: UserData())
    }
}
