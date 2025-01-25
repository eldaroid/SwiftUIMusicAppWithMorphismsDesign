//
//  HomeViewModel.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 22/05/21.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var headerStr = "Hello HSE 👋🏻"
    @Published private(set) var playlists = [MusicModel]()
    @Published private(set) var recentlyPlayed = [MusicModel]()
    
    @Published private(set) var selectedMusic: MusicModel? = nil
    @Published var displayPlayer = false
    
    init() {
        fetchPlaylist()
        fetchRecentlyPlayed()
    }
    
    private func fetchPlaylist() {
        playlists = Constants.Data.getPlaylists()
    }
    
    private func fetchRecentlyPlayed() {
        recentlyPlayed = Constants.Data.getRecentlyPlayed()
    }
    
    func selectMusic(music: MusicModel) {
        selectedMusic = music
        displayPlayer = true
    }
}
