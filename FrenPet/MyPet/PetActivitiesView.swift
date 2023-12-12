//
//  PetActivitiesView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/12.
//

import SwiftUI

struct PetActivitiesView: View {
    var body: some View {
            HStack {
                NavigationLink(destination: FirstView()) {
                    Image(systemName: "rosette")
                        .buttonStyle()
                }

                NavigationLink(destination: SecondView()) {
                    Image(systemName: "film")
                        .buttonStyle()
                }

                NavigationLink(destination: ThirdView()) {
                    Image(systemName: "mic.fill")
                        .buttonStyle()
                }

                NavigationLink(destination: FourthView()) {
                    Image(systemName: "camera.fill")
                        .buttonStyle()
                }
        }
    }
}

// 這是四個目的地視圖的占位符
struct FirstView: View {
    var body: some View {
        Text("First View")
    }
}

struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}

struct ThirdView: View {
    var body: some View {
        Text("Third View")
    }
}

struct FourthView: View {
    var body: some View {
        Text("Fourth View")
    }
}

#Preview {
    PetActivitiesView()
}
