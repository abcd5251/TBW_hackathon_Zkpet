//
//  MyPetView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct MyPetView: View {
    @State private var moveRight = false
    var body: some View {
        VStack {
            // Pet Main View
            VStack {
                PetMetricsView()

                Image("pixelArtImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .background(Color.clear)
                    .offset(x: self.moveRight ? 50 : -50, y: 0) // 左右移動 100 點的距離
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: self.moveRight)
                    .onAppear {
//                                           moveRight.toggle() // 當視圖出現時開始動畫
                    }

                PetMetricsBottomView()

                PetInteractionView()
            }
            .background(Color(red: 1.0, green: 0.8, blue: 0.6).opacity(0.3))
        }
    }
}

#Preview {
    MyPetView()
}
