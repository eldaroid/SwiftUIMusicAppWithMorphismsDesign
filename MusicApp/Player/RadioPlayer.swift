//
//  RadioPlayer.swift
//  MusicApp
//
//  Created by Эльдар Попов on 30.05.2025.
//

import AVKit
import Foundation

final class RadioPlayer: ObservableObject {
    var player = AVPlayer()
    
    @Published var isPlaying = false
    @Published var efir: MusicModel? = nil
    
    init() { }
    
    func initPlayer(url: String) {
        guard let url = URL(string: url) else { return }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
    }

    func play(_ efir: MusicModel) {
        self.efir = efir
        player.volume = 1
        player.play()
        isPlaying = true
    }
    
    func stop() {
        isPlaying = false
        player.pause()
    }
}
