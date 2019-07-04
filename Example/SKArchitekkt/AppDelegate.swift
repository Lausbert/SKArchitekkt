//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Cocoa
import CoreArchitekkt
import SKArchitekkt

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let viewController = setUpViewController(sideLength: 800)
        let rootNode = getRootNode()
        viewController.handle(rootNode: rootNode)
    }

    private func setUpViewController(sideLength: CGFloat) -> SplitViewController {
        let window = NSWindow(contentRect: NSRect(x: ((NSScreen.main?.frame.width ?? 0) - sideLength)/2, y: ((NSScreen.main?.frame.height ?? 0) - sideLength)/2, width: sideLength, height: sideLength), styleMask: [.titled, .closable, .resizable, .miniaturizable], backing: .buffered, defer: false)
        window.makeKeyAndOrderFront(nil)
        let viewController = SplitViewController.createFromStoryBoard()
        viewController.preferredContentSize = CGSize(width: sideLength, height: sideLength)
        window.contentViewController = viewController
        return viewController
    }

    private func getRootNode() -> Node {
        guard let ressourceIdentifier = UserDefaults.standard.string(forKey: "ressourceIdentifier") else { fatalError("Could not setup root node.") }
        let ressourceJsonString: String
        switch ressourceIdentifier {
        case MacOSProject.identifier():
            ressourceJsonString = MacOSProject.jsonString
        case IOSProject.identifier():
            ressourceJsonString = IOSProject.jsonString
        default:
            fatalError("Could not setup root node.")
        }
        guard let data = ressourceJsonString.data(using: String.Encoding.utf8) else { fatalError("Could not setup root node.") }
        guard let rootNode = try? JSONDecoder().decode(Node.self, from: data) else { fatalError("Could not setup root node.") }
        return rootNode
    }

}
