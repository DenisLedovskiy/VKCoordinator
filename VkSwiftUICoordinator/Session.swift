//
//  Session.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import Foundation

class Session: ObservableObject {

    static let shared = Session()

    private init() {}

    @Published var isAuthorized: Bool = false
    @Published var token = ""
    @Published var userId = ""
    @Published var version = "5.131"
    @Published var cliendId = "7822904"        

}

