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
                    .font(.subheadline)
                Text(viewModel.content)
                    .font(.body)
                HStack {
                    Text(viewModel.dateString)
                        .foregroundColor(Color(.darkGray))
                        .font(.caption)
                    Button {
                        // TODO: Implement "Reply" button
                    } label: {
                        Text("Reply")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .font(.caption)
                    }
                    Spacer()
                    Button {
                        viewModel.incrementLikes()
                    } label: {
                        HStack {
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                            Text("\(viewModel.likes)")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        .padding(4)
                    }
                }
            }
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
