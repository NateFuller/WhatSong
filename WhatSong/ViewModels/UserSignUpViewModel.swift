//
//  UserSignUpViewModel.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/23/22.
//

import Foundation
import Combine

class UserSignUpViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    
    @Published var bannerData: BannerData = .empty
    @Published var createdUser: User? = nil
    @Published var isSecured: Bool = true
    @Published var shouldDisplayBanner: Bool = false
    @Published var submitting: Bool = false
    
    private var cancellable: AnyCancellable?
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
        
        setupBindings()
    }
    
    @MainActor
    func submit() async {
        submitting = true
        
        do {
            // TODO: save this user to the session?
            _ = try await UserService().create(User(email: email, password: password))
        } catch {
            bannerData = BannerData(title: error.localizedDescription, level: .error)
        }
        
        submitting = false
    }
    
    func clearBanner() {
        bannerData = .empty
    }
    
    private func setupBindings() {
        cancellable = $bannerData.sink { [weak self] data in
            self?.shouldDisplayBanner = !data.title.isEmpty
        }
    }
}
