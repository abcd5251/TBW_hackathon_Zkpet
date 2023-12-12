//
//  MyPetViewModel.swift
//  FrenPet
//
//  Created by Michael on 2023/12/12.
//

import Foundation

enum Mood: String {
    case happy = "😄"
    case sad = "😔"
    case hungry = "😋"
    case sleepy = "😴"
    case bored = "😐"
    case sick = "🤒"
}

class MyPetViewModel: ObservableObject {
    @Published var mood: Mood = .happy
    @Published var hungerLevel: Int = 5
    @Published var energyLevel: Int = 5
    @Published var healthLevel: Int = 5
    @Published var wasteLevel: Int = 0
    
    // 更新電子雞的心情
    func updateMood() {
        if hungerLevel > 7 {
            mood = .hungry
        } else if energyLevel < 3 {
            mood = .sleepy
        } else if healthLevel < 5 {
            mood = .sick
        } else if wasteLevel > 3 {
            mood = .sad
        } else if hungerLevel < 3 && energyLevel > 7 && healthLevel > 7 {
            mood = .happy
        } else {
            mood = .bored
        }
    }
    
    // 餵食電子雞
    func feed() {
        print("feed")
        hungerLevel = max(hungerLevel - 3, 0)
        updateMood()
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
}
