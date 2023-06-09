//
//  StatsView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/12/23.
//

import SwiftUI

struct StatsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("If this app had stats they'd be here...")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

/*struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}*/
