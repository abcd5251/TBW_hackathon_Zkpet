//
//  MyPetViewModel.swift
//  FrenPet
//
//  Created by Michael on 2023/12/12.
//

import Foundation
import Combine

enum Mood: String {
    case happy = "😄"
    case sad = "😔"
    case fullEating = "😋"
    case sleepy = "😴"
    case bored = "😐"
    case sick = "🤒"
}

class MyPetViewModel: ObservableObject {
    @Published var mood: Mood = .happy
    @Published var hungerLevel: Int = 5
    @Published var fullEatingLevel: Int = 5
    @Published var energyLevel: Int = 5
    @Published var healthLevel: Int = 5
    @Published var wasteLevel: Int = 0
    
    private var wasteTimer: Timer?
    private var cancellables = Set<AnyCancellable>()
    
    // 更新電子雞的心情
    func updateMood() {
        if fullEatingLevel < 3 {
            mood = .fullEating
        } else if energyLevel < 3 {
            mood = .sleepy
        } else if healthLevel < 5 {
            mood = .sick
        } else if wasteLevel > 3 {
            mood = .sad
        } else if hungerLevel > 7 && energyLevel > 7 && healthLevel > 7 {
            mood = .happy
        } else {
            mood = .bored
        }
    }
    
    // 餵食電子雞
    func feed() {
        print("feed")
        fullEatingLevel = max(fullEatingLevel + 3, 10)
        updateMood()
        startWasterTimer()
    }
    
    // 讓電子雞休息
    func reset() {
        energyLevel = min(energyLevel + 4, 10)
        updateMood()
    }
    
    // 玩遊戲來提高電子雞的心情
    func play() {
        energyLevel = max(energyLevel - 2, 0)
        if mood != .sick {
            mood = .happy
        }
    }
    
    // 處理電子雞生病
    func medicate() {
        healthLevel = min(healthLevel + 5, 10)
        updateMood()
    }
    
    // 清理大便的方法
    func cleanUp() {
        wasteLevel = 0
        healthLevel = min(healthLevel + 1, 10)
        updateMood()
    }
    
    // 啟動或重置計時器
    func startWasterTimer() {
        // 如果已經有一個計時器在運行，先取消它
        wasteTimer?.invalidate()
        
        // 設定一個新的計時器
        wasteTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
            self?.incrementWasteLevel()
        }
    }
    
    // 增加大便數量的方法
    private func incrementWasteLevel() {
        print("incrementWasteLevel")
        wasteLevel += 1
    }
    
    // 在deinit中取消計時器
    deinit {
        wasteTimer?.invalidate()
    }
}
