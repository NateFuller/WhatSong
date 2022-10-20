//
//  GettingStartedView.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/15/22.
//

import Foundation
import SwiftUI

struct GettingStartedView: View {
    @State private var didAppear: Bool = false
    
    @State var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Image("AppTitle")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("Accent"))
                if didAppear {
                    VStack(alignment: .trailing) {
                        VStack(alignment: .leading) {
                            Text("sign in")
                                .italic()
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Accent"))
                            TextField("enter username here", text: $viewModel.usernameInput)
                                .textFieldStyle(WSTextFieldStyle())
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                        }
                        HStack {
                            Text("or")
                                .italic()
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Accent"))
                            NavigationLink {
                                
                            } label: {
                                Text("sign up")
                                    .italic()
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("Accent"))
                                    .underline()
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear() {
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    didAppear.toggle()
                }
            }
            .onDisappear() {
                didAppear.toggle()
            }
        }
    }
}

struct GettingStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedView(viewModel: LoginViewModel())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
