//
//  PlayerViewModel.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 22/05/21.
//

import Foundation

final class PlayerViewModel: ObservableObject {
    let model: MusicModel
    @Published var liked = true
    @Published var isPlaying = false
    
    init(model: MusicModel) {
        self.model = model
    }
}
