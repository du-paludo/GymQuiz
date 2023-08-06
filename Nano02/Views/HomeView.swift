//
//  HomeView.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 02/08/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: SceneManager
    let namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 64) {
                Spacer()
                Text("GymQuiz")
                    .foregroundColor(Color("bg"))
                    .multilineTextAlignment(.center)
                    .font(Font.custom("PassionOne-Bold", size: 64))
                VStack(spacing: 24) {
                    Button {
                        withAnimation(.spring()) {
                            manager.size = 1200
                            manager.color = "bg"
                            manager.animation = .opacity
                            manager.currentView = .GameView
                        }
                    } label: {
                        Text("Play")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color("bg"))
                            }
                    }
                    Button {
                        withAnimation() {
                            manager.size = 1200
                            manager.color = "orange"
                            manager.currentView = .LeaderboardView
                        }
                    } label: {
                        HStack {
                            Image(systemName: "trophy.fill")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.black)
                            Text("Leaderboard")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                    
//                    Button {
//
//                    } label: {
//                        HStack {
//                            Image(systemName: "gearshape.fill")
//                                .font(.callout)
//                                .bold()
//                                .foregroundColor(.black)
//                            Text("Settings")
//                                .font(.callout)
//                                .bold()
//                                .foregroundColor(.black)
//                        }
//                    }
                }
                Spacer()
            }
            .padding(.horizontal, 64)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().environmentObject(SceneManager())
//    }
//}
