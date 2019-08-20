//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class RightPaneViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "RightPaneCollectionViewItem"), for: indexPath) as? RightPaneCollectionViewItem else { return NSCollectionViewItem() }
        let settingsItemView = SettingsItemView.createFromNib()
        item.stackView.addArrangedSubview(settingsItemView)
        let settingsItemView2 = SettingsItemView.createFromNib()
        item.stackView.addArrangedSubview(settingsItemView2)
        return item
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let item = RightPaneCollectionViewItem.createFromNib()
        let settingsItemView = SettingsItemView.createFromNib()
        item.stackView.addArrangedSubview(settingsItemView)
        let settingsItemView2 = SettingsItemView.createFromNib()
        item.stackView.addArrangedSubview(settingsItemView2)
        return NSSize(width: collectionView.frame.width, height: item.view.fittingSize.height)
    }
    
}
