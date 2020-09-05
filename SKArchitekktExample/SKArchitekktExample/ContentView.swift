// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI

struct ContentView: View {
    @Binding var document: SKArchitekktExampleDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(SKArchitekktExampleDocument()))
    }
}
