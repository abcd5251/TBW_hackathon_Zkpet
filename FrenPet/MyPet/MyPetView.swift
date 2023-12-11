//
//  MyPetView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct MyPetView: View {
    var body: some View {
        VStack {
            // Pet Main View
            VStack {
                PetMetricsView()

                PetMetricsBottomView()
            }
        }
    }
}

#Preview {
    MyPetView()
}
