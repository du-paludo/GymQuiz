//
//  QuestionView.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 01/08/23.
//

import SwiftUI

struct QuestionView: View {
    @State var selectedOption: Option?
    @EnvironmentObject var settings: GameSettings
    @EnvironmentObject var repo: QuestionRepository
    @EnvironmentObject var manager: SceneManager
    
    var body: some View {
        VStack(spacing: 24) {
            Text(repo.currentQuestion.question)
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            RoundedRectangle(cornerRadius: 4)
                //.stroke(lineWidth: 1)
                .foregroundColor(.clear)
                .aspectRatio(1.5, contentMode: .fit)
                .overlay {
                    ZStack {
                        //RoundedRectangle(cornerRadius: 4)
                            //.foregroundColor(.white)
                        Image(repo.currentQuestion.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            VStack(spacing: 16) {
                ForEach(repo.currentQuestion.options) { option in
                    if let selected = selectedOption {
                        ListItem(option: option.name, isSelected: selected.name == option.name, isRightAnswer: option.name == repo.currentQuestion.correctOption ? true : false)
                    } else {
                        ListItem(option: option.name, isSelected: false)
                            .onTapGesture {
                                selectedOption = option
                                if selectedOption!.name == repo.currentQuestion.correctOption {
                                    settings.score += (50 + settings.timeRemaining)
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    repo.getNextQuestion()
                                    if repo.empty {
                                        withAnimation {
                                            manager.size = 600
                                            manager.color = "bg"
                                            manager.animation = .scale
                                            manager.currentView = .ScoreView
                                        }
                                    } else {
                                        selectedOption = nil
                                        settings.timeRemaining = 20
                                    }
                                }
                            }
                    }
                }
            }
        }
        //.background(Color("bg"))
    }
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView(selectedOption: .constant(Option(name: "Triceps")), hasTimeElapsed: .constant(false))
//    }
//}


// Se o usuário apertar a opção certa, a opção certa fica verde e o resto permanece igual
// Se o usuário apertar a opção errada, a opção certa fica verde a selecionada fica vermelha
