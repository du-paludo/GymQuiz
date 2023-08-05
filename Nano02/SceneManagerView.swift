//
//  SceneManager.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 03/08/23.
//

import SwiftUI

struct SceneManagerView: View {
    @StateObject var manager = SceneManager()
    @StateObject var settings = GameSettings()
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color("white")
                .ignoresSafeArea()
            withAnimation(.spring()) {
                CircleView(size: manager.size, color: manager.color, namespace: namespace)
            }
            switch manager.currentView {
            case .HomeView:
                HomeView(namespace: namespace)
                    .transition(manager.animation)
                    .preferredColorScheme(.light)
            case .GameView:
                GameView(namespace: namespace)
                    .transition(manager.animation)
                    .preferredColorScheme(.dark)
            case .ScoreView:
                ScoreView(namespace: namespace)
                    .transition(manager.animation)
                    .preferredColorScheme(.light)
            case .LeaderboardView:
                LeaderboardView(leaderboardIdentifier: "leaderboard")
                    .transition(manager.animation)
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(manager)
        .environmentObject(settings)
    }
}

struct SceneManagerView_Previews: PreviewProvider {
    static var previews: some View {
        SceneManagerView()
    }
}
