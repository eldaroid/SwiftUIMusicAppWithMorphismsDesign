//
//  PlaylistView.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 22/05/21.
//

import SwiftUI

struct PlaylistView: View {
    let name: String, artistName: String, coverImage: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            coverImage.resizable().scaledToFill()
                .frame(width: 114, height: 88).cornerRadius(16)
            Text(name).foregroundColor(.text_primary)
                .bold()
                .padding(.top, 12).padding(.bottom, 6)
            Text(artistName).foregroundColor(.text_primary_f1)
                .padding(.bottom, 8)
        }
        .padding(12).background(Color.primary_color)
        .cornerRadius(24).modifier(NeuShadow())
    }
}
