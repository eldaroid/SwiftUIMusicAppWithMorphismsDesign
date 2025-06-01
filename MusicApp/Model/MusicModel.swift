//
//  MusicModel.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 22/05/21.
//

import SwiftUI

struct MusicModel: Codable, Identifiable, Equatable {
    let id = UUID()
    let randomColor = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1) )
    let name: String
    let imageUrl: URL
    let streamUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case streamUrl = "url"
        case imageUrl = "favicon"
    }
    
    init(name: String, imageURL: URL, streamUrl: String) {
        self.name = name
        self.imageUrl = imageURL
        self.streamUrl = streamUrl
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.streamUrl = try container.decode(String.self, forKey: .streamUrl)
        
        let imageUrlString = try container.decode(String.self, forKey: .imageUrl)
        imageUrl = URL(string: imageUrlString) ?? URL(string: "https://i.postimg.cc/dVhrFLff/temp-Image-Ox-S6ie.avif")!
    }
}
