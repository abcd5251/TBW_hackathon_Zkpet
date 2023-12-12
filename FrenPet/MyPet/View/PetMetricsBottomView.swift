//
//  PetMetricsBottomView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct PetMetricsBottomView: View {
    var fullEatingLevelProgress: CGFloat
    var energyLevelProgress: CGFloat
    var healthLevelProgress: CGFloat
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "star.fill")
                    VStack {
                        Text("LEVEL")
                        Text("10")
                    }
                }
                Spacer()
                Text("Fren")
            }

            VStack {
                HStack {
                    Image("Stomach")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .background(Color.clear)

                    ProgressBarView(progress: fullEatingLevelProgress, themeBackground: .fullEating(.background), themeForeground: .fullEating(.foreground))
                        .frame(height: 20)
                }
                .padding(5)

                HStack {
                    Image(systemName: "bolt.heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .background(Color.clear)
                        .foregroundColor(Color(UIColor.systemYellow).opacity(0.7))

                    ProgressBarView(progress: energyLevelProgress, themeBackground: .energy(.background), themeForeground: .energy(.foreground))
                        .frame(height: 20)
                }
                .padding(5)

                HStack {
                    Image(systemName: "heart.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .background(Color.clear)
                        .foregroundColor(Color(UIColor.systemRed).opacity(0.7))

                    ProgressBarView(progress: healthLevelProgress, themeBackground: .health(.background), themeForeground: .health(.foreground))
                        .frame(height: 20)
                }
                .padding(5)
            }

            HStack {
                Text("REWARDS")
                Spacer()
                HStack {
                    Image(systemName: "dollarsign")
                    Text("0.00430")
                    Text("ETH")
                }
            }
        }
        .padding([.leading, .trailing], 20)
    }
}

// #Preview {
//    PetMetricsBottomView()
// }
