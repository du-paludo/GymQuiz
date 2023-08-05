//
//  UpperBar.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 02/08/23.
//

import SwiftUI

struct UpperBar: View {
    @EnvironmentObject var settings: GameSettings
    @EnvironmentObject var repo: QuestionRepository
    @EnvironmentObject var manager: SceneManager
    var namespace: Namespace.ID
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Button {
                withAnimation() {
                    manager.size = 600
                    manager.color = "bg"
                    manager.animation = .opacity
                    //manager.animation = .scale(scale: 1, anchor: .center)
                    //manager.animation = .scale(scale: 0.6, anchor: .center)
                    manager.currentView = .ScoreView
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 60, alignment: .leading)
            }
            Spacer()
            Text("\(repo.index)/10")
                .foregroundColor(.white)
                .bold()
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                }
            Spacer()
            HStack {
                Image(systemName: "timer")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                Text("\(settings.timeRemaining)")
                    .onReceive(timer) { _ in
                        if settings.timeRemaining > 0 {
                            settings.timeRemaining -= 1
                        } else {
                            repo.getNextQuestion()
                            settings.timeRemaining = 30
                        }
                    }
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: 26, alignment: .leading)
            }
            .frame(width: 60)
        }
        HStack {
            Image(systemName: "star.fill")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
            Text("\(settings.score)")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
        }
        .padding(.vertical, 8)
    }
}

//struct UpperBar_Previews: PreviewProvider {
//    static var previews: some View {
//        UpperBar()
//    }
//}
