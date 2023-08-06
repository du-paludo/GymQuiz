//
//  SceneManager.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 03/08/23.
//

import Foundation
import SwiftUI

enum Views {
    case HomeView
    case GameView
    case ScoreView
    case LeaderboardView
}

class SceneManager: ObservableObject {
    @Published var currentView = Views.HomeView
    @Published var animation = AnyTransition.scale
    @Published var size: CGFloat = 600
    @Published var color: String = "grey"
}
