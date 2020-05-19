//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: - Internal -

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let rootNode = getRootNode()
        windowCoordinator.showGraph(rootNode: rootNode)
    }

    private func getRootNode() -> Node {
        let ressourceIdentifier = UserDefaults.standard.string(forKey: "ressourceIdentifier") ?? "CocoaPodsWorkspace"
        let ressourceJsonString: String
        switch ressourceIdentifier {
        case CocoaPodsWorkspace.identifier():
            ressourceJsonString = CocoaPodsWorkspace.jsonString
        default:
            fatalError("Could not setup root node.")
        }
        guard let data = ressourceJsonString.data(using: String.Encoding.utf8) else { fatalError("Could not setup root node.") }
        guard let rootNode = try? JSONDecoder().decode(Node.self, from: data) else { fatalError("Could not setup root node.") }
        return rootNode
    }

    // MARK: - Private -

    private let windowCoordinator = WindowCoordinator()

}
