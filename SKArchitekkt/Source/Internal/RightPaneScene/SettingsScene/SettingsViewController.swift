//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class SettingsViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {

    // MARK: - Internal -

    @IBOutlet weak var collectionView: NSCollectionView!

    var settingsGroups: [SettingsGroup] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @IBAction func didPressResetButton(_ sender: Any) {
        settingsGroups.forEach { $0.reset() }
        collectionView.reloadData()
    }

    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return settingsGroups.count
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingsGroups[section].settingsItems.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let settingsItem = settingsGroups[indexPath.section].settingsItems[indexPath.item]
        switch settingsItem.value {
        case let .range(value, minValue, maxValue):
            guard let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsRangeCollectionViewItem"), for: indexPath) as? SettingsRangeCollectionViewItem else { return NSCollectionViewItem() }
            item.label.stringValue = settingsItem.name
            item.slider.minValue = minValue
            item.slider.maxValue = maxValue
            item.slider.doubleValue = value
            item.sliderChangeHandler = { [weak settingsItem] newValue in
                settingsItem?.value = .range(value: newValue, minValue: minValue, maxValue: maxValue)
            }
            return item
        }
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let settingsItem = settingsGroups[indexPath.section].settingsItems[indexPath.item]
        switch settingsItem.value {
        case .range:
            return NSSize(width: collectionView.frame.width, height: 23)
        }
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
            if let headerView = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsHeaderView"), for: indexPath) as? SettingsHeaderView {
                headerView.label.stringValue = settingsGroups[indexPath.section].name
                return headerView
            }
        case NSCollectionView.elementKindSectionFooter:
            return collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsFooterView"), for: indexPath)
        default:
            break
        }
        return NSView()
    }

}
