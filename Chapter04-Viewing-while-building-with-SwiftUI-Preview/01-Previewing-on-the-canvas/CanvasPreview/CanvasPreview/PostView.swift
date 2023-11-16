//
//  PostView.swift
//  DarkModePreview
//
//  Created by Juan Catalan on 6/25/23.
//

import SwiftUI

struct PostView: View {
    var title: String
    var text: String
    var imageName: String
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if geometry.size.height > geometry.size.width {
                    // View for portrait orientation
                    VStack(spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.75)
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                    .padding()
                } else {
                    // View for landscape orientation
                    HStack(alignment: .top, spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.55)
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview("PostView") {
    PostView(title: "Weather forecast",
             text: "Scattered thunderstorms. Potential for heavy rainfall. Low 68F. Winds light and variable. Chance of rain 60%",
             imageName: "cloud.bolt.rain")
}

