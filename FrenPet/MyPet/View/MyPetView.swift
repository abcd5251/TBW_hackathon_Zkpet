//
//  MyPetView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct MyPetView: View {
    @State private var moveRight = false
    @StateObject var viewModel = MyPetViewModel()

    var body: some View {
        NavigationView {
            // Pet Main View

            ScrollView {
                Text("Virtual Cat").font(.largeTitle)
                    .foregroundColor(Color(red: 0.4, green: 0.2, blue: 0.1).opacity(0.8))

                PetMetricsView()

                HStack(spacing: 20) {
                    Text("Mood: \(viewModel.mood.rawValue)")
                    Text("Hunger: \(viewModel.hungerLevel)")
                    Text("Energy: \(viewModel.energyLevel)")
                    Text("Health: \(viewModel.healthLevel)")
                }
                ZStack {
                    Image("pixelArtImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .background(Color.clear)
                        .offset(x: self.moveRight ? 50 : -50, y: 0) // 左右移動 100 點的距離
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: self.moveRight)
                        .onAppear {
                            moveRight.toggle() // 當視圖出現時開始動畫
                        }
                    VStack{
                        Spacer()
                        HStack {
                            ForEach(0..<viewModel.wasteLevel, id: \.self) { _ in
                                Text("💩")
                                    .font(.largeTitle)
                            }
                        }
                    }
                }

                PetMetricsBottomView()

                PetInteractionView(viewModel: viewModel)

                PetActivitiesView()
            }
            .background(Color(red: 1.0, green: 0.8, blue: 0.6).opacity(0.3))
        }
    }
}

#Preview {
    MyPetView()
}
