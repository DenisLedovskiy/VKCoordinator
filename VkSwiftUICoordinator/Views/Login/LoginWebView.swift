//
//  LoginWebView.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {

    @ObservedObject var viewModel: LoginViewModel

    let navigationDelegate = WebViewNavigationDelegate()

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        navigationDelegate.viewModel = self.viewModel
        webView.navigationDelegate = navigationDelegate
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }

    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: viewModel.cliendId),
            URLQueryItem(name: "scope", value: "270342"), // 401502
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: viewModel.version)
        ]

        return components.url.map { URLRequest(url: $0) }
    }
}

