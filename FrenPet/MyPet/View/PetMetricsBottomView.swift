//
//  PetMetricsBottomView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct PetMetricsBottomView: View {
    @State private var progress: CGFloat = 0.0
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
                ProgressBarView(progress: progress)
                    .frame(height: 20)
                    .padding(30)

                Button("增加進度") {
                    if progress < 1.0 {
                        progress += 0.1
                    }
                }
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

#Preview {
    PetMetricsBottomView()
}
