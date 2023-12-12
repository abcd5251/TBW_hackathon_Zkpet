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
                ProgressBarView(progress: fullEatingLevelProgress, themeBackground: .fullEating(.background), themeForeground: .fullEating(.foreground))
                    .frame(height: 20)
                    .padding(5)
                ProgressBarView(progress: energyLevelProgress, themeBackground: .energy(.background), themeForeground: .energy(.foreground))
                    .frame(height: 20)
                    .padding(5)
                ProgressBarView(progress: healthLevelProgress, themeBackground: .health(.background), themeForeground: .health(.foreground))
                    .frame(height: 20)
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
