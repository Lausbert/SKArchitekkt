//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class RightPaneCollectionViewItem: NSCollectionViewItem, NibLoadable {
    
    // MARK: - Internal -
    
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var stackView: NSStackView!
    
}
