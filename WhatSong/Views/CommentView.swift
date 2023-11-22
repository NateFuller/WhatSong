//
//  CommentView.swift
//  WhatSong
//
//  Created by Nathan Fuller on 9/14/22.
//

import SwiftUI

struct CommentView: View {
    var viewModel: CommentViewModel

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: viewModel.userImageURL)
                .resizable()
                .frame(width: 32, height: 32)

            VStack(alignment: .leading) {
                Text(viewModel.username)
                    .font(.caption)
                Text(viewModel.content)
                    .font(.body)
                HStack {
                    Text(viewModel.dateString)
                        .foregroundColor(.Text.secondary)
                        .font(.caption)
                    Button {
                        // TODO: Implement "Reply" button
                    } label: {
                        Text("Reply")
                            .fontWeight(.semibold)
                            .font(.caption)
                    }
                    Spacer()
                    Button {
                        viewModel.incrementLikes()
                    } label: {
                        HStack {
                            Image(systemName: "heart")
                            Text("\(viewModel.likes)")
                                .font(.caption)
                        }
                        .padding(4)
                    }
                }
            }
            .foregroundColor(.Text.primary)
        }
        .padding()
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(viewModel: CommentViewModel(comment: Comment.Fixture.basic))
            .previewLayout(.sizeThatFits)
    }
}
