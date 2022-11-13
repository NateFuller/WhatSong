//
//  UserSignUpView.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/23/22.
//

import Foundation
import SwiftUI

struct UserSignUpView: View {
    @ObservedObject var viewModel: UserSignUpViewModel = UserSignUpViewModel()
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack(spacing: 24) {
                VStack {
                    Text("Hello")
                }
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
                    
                    ZStack(alignment: .trailing) {
                        Group {
                            if viewModel.isSecured {
                                SecureField("enter password here", text: $viewModel.password)
                                    .textFieldStyle(WSTextFieldStyle())
                            } else {
                                TextField("enter password here", text: $viewModel.password)
                                    .textFieldStyle(WSTextFieldStyle())
                            }
                        }
                        
                        Button(action: {
                             viewModel.isSecured.toggle()
                        }) {
                            Image(systemName: viewModel.isSecured ? "eye.slash" : "eye")
                                .tint(Color("Accent"))
                                .frame(width: 20, height: 20)
                        }
                        .padding()
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
                    .foregroundColor(Color("Accent"))
                    .buttonStyle(.bordered)
                }
                Text(viewModel.error)
            }
            .padding()
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
