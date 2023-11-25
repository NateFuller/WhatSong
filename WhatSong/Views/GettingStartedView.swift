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
            Color.Background.page.ignoresSafeArea()
            VStack {
                Image("AppTitle")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(.slide)
                VStack(alignment: .trailing) {
                    VStack(alignment: .leading) {
                        Text("sign in")
                            .italic()
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                        TextField("",
                                  text: $viewModel.usernameInput,
                                  prompt: .placeholder("enter username here"))
                        .textFieldStyle(WSTextFieldStyle())
                        .submitLabel(.go)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    }
                    HStack {
                        Text("or")
                            .italic()
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                        NavigationLink {
                            UserSignUpView()
                        } label: {
                            Text("sign up")
                                .italic()
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .underline()
                        }
                    }
                }
                .transition(.opacity)
            }
            .padding()
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
