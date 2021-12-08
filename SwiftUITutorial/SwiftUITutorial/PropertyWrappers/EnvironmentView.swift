//
//  EnvironmentView.swift
//  SwiftUITutorial
//
//  Created by Enrique Solís on 07-12-21.
//

import SwiftUI

struct EnvironmentView: View {
    
    @EnvironmentObject var user: UserData
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
            .environmentObject(UserData())
    }
}
