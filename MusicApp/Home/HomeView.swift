//
//  HomeView.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 22/05/21.
//

import SwiftUI

struct HomeView: View {
    @State var searchTapped: Bool = false
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.primary_color.edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // Header
                    HomeHeaderView(headerStr: viewModel.headerStr, onTapSearch: { searchTapped.toggle() })
                    // Playlists
                    HomePlaylistView(
                        playlists: viewModel.playlists,
                        onSelect: viewModel.selectMusic(music:)
                    )
                    
                    // Recently Played
                    // HomeRecentlyPlayedView(recentlyPlayed: viewModel.recentlyPlayed, onSelect: viewModel.selectMusic(music:))
                    // Made for You
                     HomeMadeForView(onSelect: viewModel.selectMusic(music:))
                    
                    Spacer().frame(height: 150)
                    Spacer()
                }
                .fullScreenCover(isPresented: $viewModel.displayPlayer) {
                    if let model = viewModel.selectedMusic {
                        PlayerView(viewModel: PlayerViewModel(model: model))
                    }
                }
                .fullScreenCover(isPresented: $searchTapped) {
                    Neuromorphism()
                }
            }.animation(.spring()).edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
}

fileprivate struct HomePlaylistView: View {
    let playlists: [MusicModel], onSelect: (MusicModel) -> ()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Your Playlist").foregroundColor(.text_header)
                .bold()
                .padding(.horizontal, Constants.Sizes.HORIZONTAL_SPACING)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(0..<playlists.count, id: \.self) { i in
                        Button(action: { onSelect(playlists[i]) }, label: {
                            PlaylistView(
                                name: playlists[i].name,
                                coverImage: playlists[i].imageUrl
                           )
                        }).padding(.top, 6).padding(.bottom, 40)
                    }
                }.padding(.horizontal, Constants.Sizes.HORIZONTAL_SPACING)
            }
        }.padding(.top, 36)
    }
}

//
//fileprivate struct HomeRecentlyPlayedView: View {
//    let recentlyPlayed: [MusicModel], onSelect: (MusicModel) -> ()
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            Text("Recently Played").foregroundColor(.text_header)
//                .bold()
//                .padding(.leading, Constants.Sizes.HORIZONTAL_SPACING)
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(0..<recentlyPlayed.count, id: \.self) { i in
//                        Button(action: { onSelect(recentlyPlayed[i]) }, label: {
//                            MusicDiscView(name: recentlyPlayed[i].name,
//                                          artistName: recentlyPlayed[i].artistName,
//                                          coverImage: recentlyPlayed[i].coverImage)
//                        }).padding(.top, 6).padding(.bottom, 40)
//                    }
//                }.padding(.horizontal, Constants.Sizes.HORIZONTAL_SPACING)
//            }
//        }
//    }
//}
//
//
fileprivate struct HomeMadeForView: View {
    let onSelect: (MusicModel) -> ()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Made for You").foregroundColor(.text_header)
                .bold()
                .padding(.leading, Constants.Sizes.HORIZONTAL_SPACING)
            Button(action: { onSelect(Constants.Data.MADE_FOR_YOU) }, label: {
                MadeForView()
            }).padding([.horizontal, .top], Constants.Sizes.HORIZONTAL_SPACING).padding(.bottom, 40)
        }
    }
}
