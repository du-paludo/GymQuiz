//
//  ListItem.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 01/08/23.
//

import SwiftUI

struct ListItem: View {
    let option: String
    var isSelected: Bool = false
    var isRightAnswer: Bool = false
    
    var body: some View {
        if isSelected {
            Text(option)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .center)
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(isRightAnswer ? Color("green") : Color("red"))
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                    }
                }
        } else {
            Text(option)
                .bold()
                .foregroundColor(isRightAnswer ? .white : .black)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .center)
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(isRightAnswer ? Color("green") : .white)
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                    }
                }
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(option: "Chest")
    }
}
