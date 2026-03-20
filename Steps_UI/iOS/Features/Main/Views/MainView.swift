//
//  MainView.swift
//  Steps_UI
//
//  Created by Shubham on 20/03/26.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Variables
    @State private var viewModel = MainViewModel()
    
    
    // MARK: - Views
    var body: some View {
        ZStack {
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Welcome to your custom iOS app!")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}
