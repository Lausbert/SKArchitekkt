//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Combine

class SettingsGroupsViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {

    // MARK: - Internal -

    @IBOutlet weak var collectionView: NSCollectionView!

    var settingsGroups: [SettingsGroup] = [] {
        didSet {
            setUp()
        }
    }

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
        return max(settingsGroups[section].settingsItems.count, 1)
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard settingsGroups[indexPath.section].settingsItems.count > 0 else {
            return collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsGroupsEmptyCollectionViewItem"), for: indexPath)
        }
        let settingsItem = settingsGroups[indexPath.section].settingsItems[indexPath.item]
        switch settingsItem.value {
        case let .range(value, minValue, maxValue):
            guard let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsValueRangeCollectionViewItem"), for: indexPath) as? SettingsValueRangeCollectionViewItem else { return NSCollectionViewItem() }
            item.label.stringValue = settingsItem.name
            item.slider.minValue = minValue
            item.slider.maxValue = maxValue
            item.slider.doubleValue = value
            item.sliderChangeHandler = { [weak settingsItem] newValue in
                settingsItem?.value = .range(value: newValue, minValue: minValue, maxValue: maxValue)
            }
            return item
        case .deletable:
            guard let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsValueDeletableCollectionViewItem"), for: indexPath) as? SettingsValueDeletableCollectionViewItem else { return NSCollectionViewItem() }
            item.label.stringValue = settingsItem.name
            item.button.action = #selector(didPressButton(_:))
            item.button.target = self
            return item
        }
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let item: NSCollectionViewItem
        if settingsGroups[indexPath.section].settingsItems.count == 0 {
            item = SettingsGroupsEmptyCollectionViewItem.createFromNib()
        } else {
            let settingsItem = settingsGroups[indexPath.section].settingsItems[indexPath.item]
            switch settingsItem.value {
            case let .range(value, minValue, maxValue):
                let rangeItem = SettingsValueRangeCollectionViewItem.createFromNib()
                rangeItem.label.stringValue = settingsItem.name
                rangeItem.slider.minValue = minValue
                rangeItem.slider.maxValue = maxValue
                rangeItem.slider.doubleValue = value
                item = rangeItem
            case .deletable:
                let deletableItem = SettingsValueDeletableCollectionViewItem.createFromNib()
                deletableItem.label.stringValue = settingsItem.name
                item = deletableItem
            }
        }
        
        item.view.translatesAutoresizingMaskIntoConstraints = false
        item.view.widthAnchor.constraint(equalToConstant: collectionView.frame.width).isActive = true
        item.view.layoutSubtreeIfNeeded()
        return item.view.fittingSize
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
            if let headerView = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsGroupHeaderView"), for: indexPath) as? SettingsGroupHeaderView {
                headerView.label.stringValue = settingsGroups[indexPath.section].name
                return headerView
            }
        case NSCollectionView.elementKindSectionFooter:
            return collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SettingsGroupFooterView"), for: indexPath)
        default:
            break
        }
        return NSView()
    }
    
    // MARK: - Private -
    
    private var cancellables: [AnyCancellable] = []

    private func setUp() {
        cancellables = settingsGroups.map({ (settingsGroup) -> AnyCancellable in
           settingsGroup.objectWillChange.receive(on: DispatchQueue.main).sink { [weak self] (_) in
               self?.collectionView.reloadData()
           }
        })
    }
    
    @objc func didPressButton(_ sender: NSButton) {
        let point = sender.convert(sender.bounds.center, to: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: point) else { return }
        let settingsGroup = settingsGroups[indexPath.section]
        let settingsItem = settingsGroup.settingsItems[indexPath.item]
        switch settingsItem.value {
        case .range:
            assertionFailure()
        case .deletable:
            settingsGroup.remove(settingsItem: settingsItem)
        }
    }
    
}
