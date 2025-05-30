//
//  HomeViewModel.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 22/05/21.
//

import Foundation
import SwiftUI

public class RadioFetcher: ObservableObject {
    static let shared = RadioFetcher()
    
    @Published var isLoading = true
    @Published var efirs = [MusicModel]()
    @Published var favEfirs = [MusicModel]()
    
    private let favouritesKey = "favourites"
    
    init() {
        load()
    }
    
    private func load() {
        isLoading = true
        guard let url = URL(string: "https://de1.api.radio-browser.info/json/stations/bycodec/aac?limit=60&order=clocktrend&hidebroken=true") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let decodedLists = try JSONDecoder().decode([MusicModel].self, from: data)
                    DispatchQueue.main.async {
                        print("decodedLists = \(decodedLists)")
                        print("\n\n\n\n\n\n")
                        self.efirs = decodedLists.filter { !$0.name.isEmpty && $0.imageUrl.absoluteString != "https://i.postimg.cc/dVhrFLff/temp-Image-Ox-S6ie.avif" }
                        print(self.efirs)
                        self.isLoading = false
                        _ = self.getFavourites()
                    }
                } else {
                    print("no data.")
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }
            } catch {
                print("error.")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
    
    // Сохранение массива названий избранных станций в UserDefaults
    func saveFavourites(_ favEfirs: [MusicModel]) { // UUID
        let favStrArr = favEfirs.map({ $0.name })
        UserDefaults.standard.set(favStrArr, forKey: favouritesKey)
        UserDefaults.standard.synchronize()
    }
        
    // Получение массива избранных названий станций из UserDefaults
    private func getFavourites() -> [MusicModel] {
        let favStrArr = UserDefaults.standard.array(forKey: favouritesKey) as? [String] ?? []
        let efirsStrArr = self.efirs.map({ $0.name })
        let newFavStrArr = favStrArr.filter { efirsStrArr.contains($0) }
        let newfavArr = efirs.filter { newFavStrArr.contains($0.name) }
        self.favEfirs = newfavArr
        return newfavArr
    }
    
    func favAdd(efir: MusicModel) {
        favEfirs.append(efir)
    }

    func favDel(efir: MusicModel) {
        favEfirs.removeAll() { $0 == efir }
    }
}

final class HomeViewModel: ObservableObject {
    @Published private(set) var headerStr = "Hello HSE 👋🏻"
    @Published private(set) var playlists = [MusicModel]()
    @Published private(set) var recentlyPlayed = [MusicModel]()
    
    @Published private(set) var selectedMusic: MusicModel? = nil
    var fetcher = RadioFetcher.shared
    @Published var displayPlayer = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.fetchPlaylist()
        }
    }
    
    private func fetchPlaylist() {
        playlists = fetcher.efirs
    }
    
    func selectMusic(music: MusicModel) {
        selectedMusic = music
        displayPlayer = true
    }
}
