// Copyright © 2020 Stephan Lerner. All rights reserved.

import Cocoa
import CoreArchitekkt

class PaneCoordinator: ViewCoordinator<NoDependencies> {
    
    // MARK: - Internal -
    
    @IBOutlet weak var stackView: NSStackView!
    @IBOutlet weak var containerView: NSView!
    
    func transition<T: NSTabViewController & Coordinating>(toCoordinator to: T, withTabImages tabImages: [NSImage], options: NSViewController.TransitionOptions = [.crossfade], completionHandler: (() -> Void)? = nil) {
        updateStackView(withTabImages: tabImages)
        transition(toCoordinator: to, in: containerView, options: options, completionHandler: completionHandler)
        if let button = buttons.first {
            didSelectButton(button)
        }
    }
    
    // MARK: - Private -
    
    private var oldSelection: Int = 0
    private var newSelection: Int = 0
    private var tabViewController: NSTabViewController? { child() }
    private var buttons: [NSButton] { stackView.arrangedSubviews as? [NSButton] ?? [] }
    
    private func updateStackView(withTabImages tabImages: [NSImage]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for (index, tabImage) in tabImages.enumerated() {
            let button = NSButton(
                image: tabImage,
                target: self,
                action: #selector(didSelectButton(_:))
            )
            button.tag = index
            button.setButtonType(.toggle)
            button.bezelStyle = .regularSquare
            button.isBordered = false
            stackView.addArrangedSubview(button)
        }
    }

    @objc private func didSelectButton(_ sender: NSButton) {
        newSelection = sender.tag
        tabViewController?.selectedTabViewItemIndex = newSelection

        buttons[oldSelection].state = .off
        sender.state = .on

        oldSelection = newSelection
    }

}
