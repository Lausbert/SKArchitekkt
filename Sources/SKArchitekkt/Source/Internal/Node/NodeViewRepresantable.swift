// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import SpriteKit
import CoreArchitekkt
import SwiftUI

struct NodeViewRepresantable: NSViewRepresentable {
    
    // MARK: - Internal -
    
    @Binding var document: Document
    let scene: NodeScene
    let proxy: GeometryProxy

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeNSView(context: Context) -> SKView {
        scene.size = proxy.size
        context.coordinator.scene = scene

        let view = NodeViewRepresantable.NodeView()
        view.ignoresSiblingOrder = false
        #if DEBUG
        view.showsFPS = true
        #endif
        view.presentScene(scene)
        return view
    }

    func updateNSView(_ nsView: SKView, context: Context) {
        context.coordinator.resizeScene(proxy: proxy)
        scene.updateRendering(document: document) // This seems to be the only possible way to intercept changes of a @Binding in a non-View class
    }

    class Coordinator: NSObject {
        weak var scene: SKScene?

        func resizeScene(proxy: GeometryProxy) {
            scene?.size = proxy.size
        }
    }
    
    private class NodeView: SKView {

        override func scrollWheel(with event: NSEvent) {
            self.scene?.scrollWheel(with: event)
        }

        override func magnify(with event: NSEvent) {
            self.scene?.magnify(with: event)
        }

    }
            
}
