//
//  Data.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 22/05/21.
//

import SwiftUI

enum Constants {
    enum Sizes {
        static let HORIZONTAL_SPACING: CGFloat = 24
    }
    
    enum Data {
        static let MADE_FOR_YOU = MusicModel(name: "Bad Liar", artistName: "Anna Hamilton", coverImage: Image.cover3)
        
        static func getPlaylists() -> [MusicModel] {
            return [
                MusicModel(name: "You & Me", artistName: "Imagine Dragons", coverImage: Image.cover5),
                MusicModel(name: "Heart Beats", artistName: "The Chainsmokers", coverImage: Image.cover1),
                MusicModel(name: "Young Love", artistName: "Selena Gomez", coverImage: Image.cover2),
                MusicModel(name: "Falling", artistName: "Harry Styles", coverImage: Image.cover4),
                MusicModel(name: "Bad Liar", artistName: "Anna Hamilton", coverImage: Image.cover3)
            ]
        }
        
        static func getRecentlyPlayed() -> [MusicModel] {
            return [
                MusicModel(name: "Falling", artistName: "Harry Styles", coverImage: Image.cover4),
                MusicModel(name: "Bad Liar", artistName: "Anna Hamilton", coverImage: Image.cover3),
                MusicModel(name: "Young Love", artistName: "Selena Gomez", coverImage: Image.cover2),
                MusicModel(name: "You & Me", artistName: "Imagine Dragons", coverImage: Image.cover5),
                MusicModel(name: "Heart Beats", artistName: "The Chainsmokers", coverImage: Image.cover1)
            ]
        }
    }
}
