//
//  ContentView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var settings = GlobalSettings()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        TabView(selection: $settings.selectedTabIndex) {
//            HomeView().tabItem {
//                NavigationLink(destination: HomeView()) {
//                    Label("Home", systemImage: "house")
//                }
//            }.tag(1)
        }
    }
}

#Preview {
    ContentView()
}
