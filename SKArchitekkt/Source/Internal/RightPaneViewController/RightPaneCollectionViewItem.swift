//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class RightPaneCollectionViewItem: NSCollectionViewItem, NibLoadable {
    
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var stackView: NSStackView!
    
}
