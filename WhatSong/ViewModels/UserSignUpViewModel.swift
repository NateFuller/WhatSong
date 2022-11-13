//
//  UserSignUpViewModel.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/23/22.
//

import Foundation

class UserSignUpViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    
    @Published var createdUser: User? = nil
    @Published var isSecured: Bool = true
    @Published var submitting: Bool = false
    @Published var error: String = ""
    
    @MainActor
    func submit() async {
        submitting = true
        
        var user: User?
        
        do {
            user = try await UserService().create(User(email: email, password: password))
        } catch {
            self.error = error.localizedDescription
        }
        
        submitting = false
    }
}
