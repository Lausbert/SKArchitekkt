// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

public struct SKArchitekktView: View {
    @Binding var document: Document
    
    @State private var isShowingRightPane: Bool = true

    public var body: some View {
        GeometryReader { geometry in
            Divider()
            VStack {
                HStack {
                    VStack { Text("Pane 1") }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    if isShowingRightPane {
                        ExDivider()
                        VStack { Text("Pane 2") }.frame(width: 250, height: geometry.size.height)
                            .transition(.move(edge: .trailing)).fixedSize()
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .toolbar {
                Button(
                    action: {
                        withAnimation {
                            isShowingRightPane.toggle()
                        }
                    }
                ) {
                    Image(systemName: "sidebar.right")
                }
            }
        }
    }
    
    public init(document: Binding<Document>) {
        self._document = document
    }
}

struct SKArchitekktView_Previews: PreviewProvider {
    static var previews: some View {
        SKArchitekktView(document: .constant(Document()))
    }
}

struct ExDivider: View {
    let color: Color = .black
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
