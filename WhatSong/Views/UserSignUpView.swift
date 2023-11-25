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
    
    @State var isSubmitting: Bool = false
    @FocusState var focusedField: FocusableField?
    
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
                    TextField("", text: $viewModel.email, prompt: .placeholder("enter email here"))
                        .textFieldStyle(WSTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .password
                        }
                        .focused($focusedField, equals: .email)
                    Text("password")
                        .italic()
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    
                    SecureField("", text: $viewModel.password, prompt: .placeholder("enter password here"))
                        .textFieldStyle(WSTextFieldStyle())
                        .submitLabel(.go)
                        .onSubmit {
                            Task {
                                await viewModel.submit()
                            }
                        }
                        .focused($focusedField, equals: .password)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        Task {
                            await submit()
                        }
                    }, label: {
                        Text("submit")
                            .italic()
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .underline()
                    })
                    .disabled(isSubmitting)
                }
                
                Spacer()
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
    
    private func submit() async {
        isSubmitting = true
        await viewModel.submit()
        isSubmitting = false
    }
}

extension UserSignUpView {
    enum FocusableField {
        case email
        case password
    }
}

struct UserSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignUpView(viewModel: UserSignUpViewModel())
            .previewLayout(.sizeThatFits)
    }
}
