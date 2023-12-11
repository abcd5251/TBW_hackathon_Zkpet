//
//  PetMetricsView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct PetMetricsView: View {
    var body: some View {
        HStack {
            HStack {
                HStack {
                    Image(systemName: "cat")
                    VStack {
                        Text("TOD")
                        Text("232323FE")
                    }
                }
                
                Spacer()

                HStack {
                    Image(systemName: "heart")
                    VStack {
                        Text("HEALTH")
                        Text("HAPPY")
                    }
                }
            }
            .padding([.leading, .trailing], 20)
        }
    }
}

#Preview {
    PetMetricsView()
}
