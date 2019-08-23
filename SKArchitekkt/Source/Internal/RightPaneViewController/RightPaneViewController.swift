//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class RightPaneViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {
    
    // MARK: - Internal -
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    var settings: Settings!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return settings.settingsGroups.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.settingsGroups[section].settingsItems.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "RightPaneCollectionViewItem"), for: indexPath) as? RightPaneCollectionViewItem else { return NSCollectionViewItem() }
        item.label.stringValue = settings.settingsGroups[indexPath.section].settingsItems[indexPath.item].name
        return item
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let item = RightPaneCollectionViewItem.createFromNib()
        return NSSize(width: collectionView.frame.width, height: item.view.fittingSize.height)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: collectionView.frame.width, height: 20)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSSize(width: collectionView.frame.width, height: 8)
    }
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        switch kind {
        case NSCollectionView.elementKindSectionHeader:
            if let headerView = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "RightPaneHeaderView"), for: indexPath) as? RightPaneHeaderView {
                headerView.label.stringValue = settings.settingsGroups[indexPath.section].name
                return headerView
            }
        case NSCollectionView.elementKindSectionFooter:
            if let footerView = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "RightPaneFooterView"), for: indexPath) as? RightPaneFooterView {
                return footerView
            }
        default:
            break
        }
        return NSView()
    }
    
}
