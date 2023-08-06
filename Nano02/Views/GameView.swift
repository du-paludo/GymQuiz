//
//  ContentView.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 01/08/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var settings: GameSettings
    @StateObject var repo = QuestionRepository()
    @EnvironmentObject var manager: SceneManager
    let namespace: Namespace.ID
    
    var body: some View {
            VStack() {
                ZStack {
                    VStack(spacing: 24) {
                        UpperBar(namespace: namespace)
                        QuestionView()
                        Spacer()
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                }
            }
            .environmentObject(repo)
            .onAppear() {
                settings.score = 0
            }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
