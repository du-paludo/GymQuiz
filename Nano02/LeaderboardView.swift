//
//  GameCenterView.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 04/08/23.
//

import SwiftUI
import GameKit

struct Player: Hashable, Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return rhs.score > lhs.score
    }
    
    let id = UUID()
    let name: String
    let score: String
    let image: UIImage?
}

struct LeaderboardView: View {
    @EnvironmentObject var manager: SceneManager
    
    @AppStorage("GKGameCenterViewControllerState") var gameCenterViewControllerState:GKGameCenterViewControllerState = .default
    @AppStorage("IsGameCenterActive") var isGKActive:Bool = false
    var leaderboardIdentifier = "leaderboard"
    @State var playersList: [Player] = []
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            Task {
                await loadLeaderboard()
            }
        }
    }
        
    func loadLeaderboard() async {
        Task {
            var playersListTemp: [Player] = []
            let leaderboards = try await GKLeaderboard.loadLeaderboards(IDs: [leaderboardIdentifier])
            if let leaderboard = leaderboards.first {
                let allPlayers = try await leaderboard.loadEntries(for: .global, timeScope: .allTime, range: NSRange(1...5))
                if allPlayers.1.count > 0 {
                    for entry in allPlayers.1 {
                        let image = try await entry.player.loadPhoto(for: .small)
                        playersListTemp.append(Player(name: entry.player.displayName, score: entry.formattedScore, image: image))
                    }
                }
            }
            playersListTemp.sort {
                $0.score > $1.score
            }
            print("playersList")
            print(playersListTemp)
            
            playersList = playersListTemp
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button {
                withAnimation() {
                    manager.size = 600
                    manager.color = "grey"
                    manager.currentView = .HomeView
                }
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                    Text("Home")
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
        }
        VStack {
            Text("Leaderboard")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(Font.custom("PassionOne-Bold", size: 56))
            ForEach(playersList, id: \.self) { item in
                HStack(alignment: .center) {
                    Image(uiImage: item.image!)
                        .resizable()
                        .frame(width: 48, height: 48, alignment: .center)
                        .clipShape(Circle())
                    VStack(alignment: .center) {
                        Text(item.name)
                            .fontWeight(.heavy)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .truncationMode(.tail)
                            .frame(minWidth: 160, idealWidth: 160, maxWidth: 160)
                        Text(item.score)
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
        }
        .padding(.top, 64)
        .onAppear() {
            if !GKLocalPlayer.local.isAuthenticated {
                authenticateUser()
            } else {
                Task {
                    await loadLeaderboard()
                }
            }
        }
    }
}

//struct LeaderboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaderboardView()
//    }
//}
