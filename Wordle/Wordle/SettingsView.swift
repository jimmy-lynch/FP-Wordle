//
//  SettingsView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/18/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("If this app had settings they'd be here...")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
