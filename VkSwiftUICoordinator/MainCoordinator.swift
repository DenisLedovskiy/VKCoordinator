//
//  MainCoordinator.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import UIKit
import Combine
import SwiftUI

class MainCoordinator {

    let navigationController: UINavigationController

    private let loginViewModel: LoginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []

    init(navigationController: UINavigationController) {
        let loginView = VKLoginWebView(viewModel: loginViewModel)
        let loginViewController = UIHostingController(rootView: loginView)
        self.navigationController = UINavigationController(rootViewController: loginViewController)
    }

    public func start() {
        loginViewModel.$isAuthorized.subscribe(on: RunLoop.main).sink { [weak self] isAuthorized in
            guard let self = self else { return }
            if !isAuthorized {
                self.navigationController.popToRootViewController(animated: true)
            } else {
                let tabBar = self.createTabBar()
                self.navigationController.pushViewController(tabBar, animated: true)
            }
        }.store(in: &cancellables)
    }

    private func createTabBar() -> UIViewController {
        let tabBarView = TabBarView(viewModel: loginViewModel)
        return UIHostingController(rootView: tabBarView)
    }

}

