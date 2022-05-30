//
//  Extensions.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Array {
  func chunked(into size: Int) -> [[Element]] {
      return stride(from: 0, to: count, by: size).map {
          Array(self[$0 ..< Swift.min($0 + size, count)])
      }
  }
}

