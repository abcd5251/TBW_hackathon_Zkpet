//
//  WheelView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

struct PrizeRouletteView: View {
    // 旋轉的角度
    @State private var rotation: Double = 0
    // 當前選中的輪盤值
    @State private var selectedValue = ""
    // 輪盤的值
    let wheelValues: [String] = ["100 points", "200 points", "300 points", "Nothing", "500 points", "1000 points"]
    // 輪盤每個區域的角度大小
    var anglePerSection: Double {
        360 / Double(wheelValues.count)
    }

    var body: some View {
        VStack {
            // 顯示輪盤的圖片
            Image(systemName: "circle") // 這裡使用系統圖標作為示例
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(rotation))
                .onAppear() {
                    // 設置初始旋轉值，這樣輪盤值對應的扇形區域才會正確
                    rotation = -anglePerSection / 2
                }

            // 顯示當前選中的值
            Text("Selected: \(selectedValue)")
                .font(.title)
                .padding()

            // 旋轉輪盤的按鈕
            Button("Spin Wheel") {
                // 從當前角度開始旋轉到一個隨機的角度
                let rotations = 5 // 旋轉幾圈
                let randomSpin = Double.random(in: 0...360)
                let totalRotation = rotation + (360 * Double(rotations)) + randomSpin
                
                withAnimation(.easeOut(duration: 3)) {
                    rotation = totalRotation
                }

                // 計算停止位置
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
                    let computedValue = Int((totalRotation).truncatingRemainder(dividingBy: 360) / anglePerSection)
                    selectedValue = wheelValues[computedValue]
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    PrizeRouletteView()
}
