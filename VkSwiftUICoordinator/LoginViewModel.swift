//
//  LoginViewModel.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var isAuthorized: Bool = false
    @Published var userId: String = ""
    @Published var token: String = ""
    @Published var version = "5.131"
    @Published var cliendId = "8008842"
}

//8008842
//7822904
