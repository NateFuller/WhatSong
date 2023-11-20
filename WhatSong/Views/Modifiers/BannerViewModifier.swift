//
//  BannerViewModifier.swift
//  WhatSong
//
//  Created by Nathan Fuller on 11/15/22.
//

import SwiftUI

struct BannerViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let data: BannerData
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content.overlay(
            VStack {
                if isPresented {
                    VStack {
                        BannerView(data: data)
                        Spacer()
                    }
                    .background(.clear)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                withAnimation {
                                    isPresented = false
                                }
                            }
                    )
                }
            }
                .animation(.easeInOut(duration: 0.4), value: isPresented)
        )
    }
}

extension View {
    func banner(isPresented: Binding<Bool>, data: BannerData, action: (() -> Void)? = nil) -> some View {
        self.modifier(BannerViewModifier(isPresented: isPresented, data: data, action: action))
    }
}
