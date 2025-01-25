//
//  HomeHeaderView.swift
//  SwiftUIMusicAppWithMorphismsDesign
//
//  Created by Эльдар Попов on 25.01.2025.
//

import SwiftUI

struct HomeHeaderView: View {
    let headerStr: String
    let onTapSearch: () -> ()
    var body: some View {
        HStack(alignment: .center) {
            Text(headerStr).foregroundColor(.text_header)
                .bold()
            Spacer()
            Button(action: onTapSearch) {
                Image.search.resizable().frame(width: 16, height: 16)
                    .padding(12).background(Color.primary_color)
                    .cornerRadius(20).modifier(NeuShadow())
            }
        }.padding(.top, 12).padding(.horizontal, Constants.Sizes.HORIZONTAL_SPACING)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct Neuromorphism: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.offWhite)
                .frame(width: 300, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
            Button(action: {
                print("Button tapped")
            }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.gray)
            }
            .buttonStyle(SimpleButtonStyle())
            
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image.close.resizable().frame(width: 20, height: 20)
                            .padding(12)
                            .background(Color.primary_color)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, Constants.Sizes.HORIZONTAL_SPACING)
                    .padding(.top, 60)
                    Spacer()
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
