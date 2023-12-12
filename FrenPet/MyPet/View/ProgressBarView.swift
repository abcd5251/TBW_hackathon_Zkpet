//
//  ProgressBarView.swift
//  FrenPet
//
//  Created by Michael on 2023/12/11.
//

import SwiftUI

enum ThemeColor {
    case fullEating(ProgressType)
    case energy(ProgressType)
    case health(ProgressType)

    enum ProgressType {
        case background
        case foreground
    }

    var color: Color {
        switch self {
        case .fullEating(let type):
            switch type {
            case .background:
                return Color(UIColor.systemTeal)
            case .foreground:
                return Color(UIColor.systemBlue).opacity(0.7)
            }

        case .energy(let type):
            switch type {
            case .background:
                return Color(UIColor.systemYellow).opacity(0.5)
            case .foreground:
                return Color(UIColor.systemYellow).opacity(0.7)
            }

        case .health(let type):
            switch type {
            case .background:
                return Color(UIColor.systemPink)
            case .foreground:
                return Color(UIColor.systemRed).opacity(0.7)
            }
        }
    }
}

struct ProgressBarView: View {
    var progress: CGFloat // 百分比，範圍從 0.0 到 1.0
    var themeBackground: ThemeColor
    var themeForeground: ThemeColor

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(themeBackground.color)

                Rectangle()
                    .frame(width: min(CGFloat(self.progress) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(themeForeground.color)
                    .animation(.linear, value: progress)
            }
            .cornerRadius(45.0)
        }
    }
}

// #Preview {
//    ProgressBarView()
// }
