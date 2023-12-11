//
//  PetMetricsBottomView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct PetMetricsBottomView: View {
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "cat")
                    VStack {
                        Text("TOD")
                        Text("232323FE")
                    }
                }
                Spacer()
                Text("Fren")
            }
        }
        .padding([.leading, .trailing], 20)
    }
}

#Preview {
    PetMetricsBottomView()
}
