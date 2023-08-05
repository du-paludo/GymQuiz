//
//  GameSettings.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 01/08/23.
//

import Foundation

class GameSettings: ObservableObject {
    @Published var score = 0
    @Published var timeRemaining = 30
}
