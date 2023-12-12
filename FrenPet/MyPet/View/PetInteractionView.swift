//
//  PetInteractionView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/12.
//

import SwiftUI

struct PetInteractionView: View {
    var viewModel: MyPetViewModel
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            Button(action: {
                print("fish button tapped")
                self.viewModel.feed()
            }) {
                Image(systemName: "fish")
                    .buttonStyle()
            }

            Button(action: {
                print("birthday.cake button tapped")
            }) {
                Image(systemName: "waterbottle")
                    .buttonStyle()
            }

            Button(action: {
                print("teddybear button tapped 玩遊戲來提高電子雞的心情")
                self.viewModel.play()
            }) {
                Image(systemName: "teddybear")
                    .buttonStyle()
            }

            Button(action: {
                print("bird button tapped 讓電子雞休息")
                self.viewModel.reset()
            }) {
                Image(systemName: "bed.double")
                    .buttonStyle()
            }

            Button(action: {
                print("sick button tapped 處理電子雞生病")
                self.viewModel.medicate()
            }) {
                Image(systemName: "syringe")
                    .buttonStyle()
            }

            Button(action: {
                print("waterbottle button tapped 清理大便的方法")
                self.viewModel.cleanUp()
            }) {
                Image(systemName: "tray.and.arrow.up")
                    .buttonStyle()
            }
        }
        .padding()
    }
}

// 定義一個按鈕樣式的擴展，用於所有按鈕以保持一致的外觀
extension Image {
    func buttonStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .padding()
            .background(Color(red: 1.0, green: 0.8, blue: 0.6).opacity(0.3))
            .foregroundColor(Color(red: 1.0, green: 0.8, blue: 0.6).opacity(0.9))
            .cornerRadius(10)
    }
}

// #Preview {
//    PetInteractionView()
// }
