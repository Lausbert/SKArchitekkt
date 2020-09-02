// Copyright © 2020 Stephan Lerner. All rights reserved.

import AppKit

extension NSResponder {

    // MARK: - Internal -

    @objc func didSetRightPane(_ sender: Any?, visible: Bool) {
        nextResponder?.didSetRightPane(sender, visible: visible)
    }

}
