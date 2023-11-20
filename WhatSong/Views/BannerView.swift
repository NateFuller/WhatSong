//
//  BannerView.swift
//  WhatSong
//
//  Created by Nathan Fuller on 11/15/22.
//

import SwiftUI

struct BannerData {
    let title: String
    var actionTitle: String? = nil
    // Level to drive tint colors and importance of the banner.
    var level: Level = .info
    
    enum Level {
        case info
        case warning
        case error
        case success
        
        var tintColor: Color {
            switch self {
            case .info: return .blue
            case .warning: return .yellow
            case .success: return .green
            case .error: return .Background.error
            }
        }
        
        var textColor: Color {
            switch self {
            default: return .white
            }
        }
    }
    
    static let empty = BannerData(title: "")
}

struct BannerView: View {
    let data: BannerData
    var action: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(data.title)
                .font(.custom("Helvetica Neue Medium Italic", size: 16))
                .foregroundColor(data.level.textColor)
            Spacer()
            if action != nil {
                Button {
                    action?()
                } label: {
                    Text(data.actionTitle ?? "Action")
                        .foregroundColor(data.level.textColor)
                        .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                        .background(Rectangle().foregroundColor(Color.black.opacity(0.3)))
                }
            }
        }
        .padding()
        .background(data.level.tintColor)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(data: BannerData(title: "Not enough cookies!", level: .error))
    }
}

