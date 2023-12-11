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
            TabView(selection: $settings.selectedTabIndex) {
                MyPetView().tabItem {
                    NavigationLink(destination: MyPetView()) {
                        Label("My Pet", systemImage: "cat")
                    }
                }.tag(1)
            }
        }        
    }
}

#Preview {
    ContentView()
}
