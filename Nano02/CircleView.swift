//
//  CircleView.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 03/08/23.
//

import SwiftUI

struct CircleView: View {
    var size: CGFloat
    var color: String
    let namespace: Namespace.ID
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .size(width: size, height: size)
                .offset(x: (geometry.size.width - size)/2, y: (geometry.size.height - size)/2)
                .matchedGeometryEffect(id: "circle", in: namespace)
                .foregroundColor(Color(color))
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(size: 1000, color: "bg", namespace: Namespace().wrappedValue)
    }
}
