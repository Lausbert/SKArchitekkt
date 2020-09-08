// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

public struct SKArchitekktView: View {
    @Binding var document: Document

    public var body: some View {
        EmptyView()
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
