//
//  UserSignUpView.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/23/22.
//

import Foundation
import SwiftUI
import Combine

struct UserSignUpView: View {
    @ObservedObject var viewModel: UserSignUpViewModel
    
    var cancellable: AnyCancellable?
    
    init(viewModel: UserSignUpViewModel = UserSignUpViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.Background.page.ignoresSafeArea()
            VStack(spacing: 24) {
                VStack(alignment: .leading) {
                    Text("email")
                        .italic()
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.Text.primary)
                    TextField("", text: $viewModel.email, prompt: .placeholder("enter email here"))
                        .textFieldStyle(WSTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    Text("password")
                        .italic()
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.Text.primary)
                    
                    SecureField("", text: $viewModel.password, prompt: .placeholder("enter password here"))
                        .textFieldStyle(WSTextFieldStyle())
                        .onSubmit {
                            Task {
                                await viewModel.submit()
                            }
                        }
                }
                
                HStack {
                    Spacer()
                    Button("submit") {
                        Task {
                            await viewModel.submit()
                        }
                    }
                    .font(.custom("Helvetica Neue Medium Italic", size: 18))
                    .foregroundColor(.Text.primary)
                    .buttonStyle(.bordered)
                }
            }
            .padding()
        }
        .banner(isPresented: $viewModel.shouldDisplayBanner, data: viewModel.bannerData) {
            viewModel.clearBanner()
        }
        .onDisappear {
            viewModel.clearBanner()
        }
    }
}

struct UserSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignUpView(viewModel: UserSignUpViewModel())
            .previewLayout(.sizeThatFits)
    }
}
