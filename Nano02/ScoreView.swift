//
//  ScoreView.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 02/08/23.
//

import SwiftUI
import GameKit

struct ScoreView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var settings: GameSettings
    let namespace: Namespace.ID

    var body: some View {
        VStack(spacing: 64) {
            Spacer()
            Text("Nice!")
                .foregroundColor(.white)
                .font(.title)
                .bold()
            Text("\(settings.score) points")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(Font.custom("PassionOne-Bold", size: 64))
            VStack(spacing: 24) {
                Button {
                    withAnimation() {
                        manager.size = 1000
                        manager.color = "bg"
                        //manager.animation = .scale
                        //manager.animation = .scale(scale: 0.6, anchor: .center)
                        manager.currentView = .GameView
                    }
                } label: {
                    Text("Play again")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Color("bg"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                        }
                }
                Button {
                    withAnimation() {
                        manager.size = 600
                        manager.color = "grey"
                        //manager.animation = .opacity
                        manager.animation = .scale
                        manager.currentView = .HomeView
                    }
                } label: {
                    HStack {
                        Image(systemName: "house.fill")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.white)
                        Text("Home")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 64)
        .onAppear {
            if GKLocalPlayer.local.isAuthenticated {
                let player = GKLocalPlayer()
                Task {
                    try await GKLeaderboard.submitScore(settings.score, context: 0, player: player, leaderboardIDs: ["leaderboard"])
                }
            }
        }
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}
