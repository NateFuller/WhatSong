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
            Color("Background")
                .ignoresSafeArea()
            VStack(spacing: 24) {
                VStack(alignment: .leading) {
                    Text("email")
                        .italic()
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Accent"))
                    TextField("enter email here", text: $viewModel.email)
                        .textFieldStyle(WSTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    Text("password")
                        .italic()
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Accent"))
                    
                    SecureField("enter password here", text: $viewModel.password) {
                        Task {
                            await viewModel.submit()
                        }
                    }
                    .textFieldStyle(WSTextFieldStyle())
                }
                
                HStack {
                    Spacer()
                    Button("submit") {
                        Task {
                            await viewModel.submit()
                        }
                    }
                    .font(.custom("Helvetica Neue Medium Italic", size: 18))
                    .foregroundColor(Color("Accent"))
                    .buttonStyle(.bordered)
                }
            }
            .padding()
        }
        .banner(isPresented: $viewModel.shouldDisplayBanner, data: viewModel.bannerData) {
            viewModel.clearBanner()
        }
    }
}

struct UserSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignUpView(viewModel: UserSignUpViewModel())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
