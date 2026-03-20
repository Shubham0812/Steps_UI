//
//  ViewExtensions.swift
//  Steps_UI
//
//  Created by Shubham on 20/03/26.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

