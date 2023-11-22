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
        NavigationStack {
            ZStack {
                Color.Background.page
                    .ignoresSafeArea()
                VStack {
                    Image("AppTitle")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.Text.primary)
                    if didAppear {
                        VStack(alignment: .trailing) {
                            VStack(alignment: .leading) {
                                Text("sign in")
                                    .italic()
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.Text.primary)
                                TextField("",
                                          text: $viewModel.usernameInput,
                                          prompt: .placeholder("enter username here"))
                                    .textFieldStyle(WSTextFieldStyle())
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                            }
                            HStack {
                                Text("or")
                                    .italic()
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.Text.primary)
                                NavigationLink {
                                    UserSignUpView()
                                } label: {
                                    Text("sign up")
                                        .italic()
                                        .font(.system(size: 24))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.Text.primary)
                                        .underline()
                                }
                            }
                        }
                    }
                }
                .padding()
                .onAppear() {
                    if !didAppear {
                        withAnimation(.easeInOut(duration: 1).delay(1)) {
                            didAppear.toggle()
                        }
                    }
                }
            }
        }
        .tint(.Text.primary)
    }
}

struct GettingStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedView(viewModel: LoginViewModel())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
