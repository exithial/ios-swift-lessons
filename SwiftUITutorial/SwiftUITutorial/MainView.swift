//
//  MainView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            VStack {
                MapView()
                    .frame(height: 400)
                ImageView()
                    .offset(y: -150)
                Divider()
                    .padding()
                ContentView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 12 Pro")
            .previewInterfaceOrientation(.portrait)
            MainView()
                .preferredColorScheme(.dark)
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .previewInterfaceOrientation(.portrait)
        }
    }
}
