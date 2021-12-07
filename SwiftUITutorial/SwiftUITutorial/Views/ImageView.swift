//
//  ImageView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Image("eseg")
                .resizable()
                .padding(50)
                .frame(width: 300, height: 300)
                .background(Color.gray)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 4)
                )
                .shadow(color: Color.gray, radius: 5)
            Image(systemName: "person.fill.badge.minus")
                .resizable()
                .padding(50)
                .frame(width: 300, height: 300)
                .background(Color.gray)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 4)
                )
                .shadow(color: Color.gray, radius: 5)
                .foregroundColor(.blue)
        }
            
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
            .previewDevice("iPhone 12 Pro")
.previewInterfaceOrientation(.portrait)
    }
}
