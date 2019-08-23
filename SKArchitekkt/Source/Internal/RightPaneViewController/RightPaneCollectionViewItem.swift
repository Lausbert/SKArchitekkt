//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class RightPaneCollectionViewItem: NSCollectionViewItem, NibLoadable {
    
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var slider: NSSlider!
    
    var sliderChangeHandler: (Double) -> Void = { value in }
    
    @IBAction func valueDidChange(_ slider: NSSlider) {
        sliderChangeHandler(slider.doubleValue)
    }
}
