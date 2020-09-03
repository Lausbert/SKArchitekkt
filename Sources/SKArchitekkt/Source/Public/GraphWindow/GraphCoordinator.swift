//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

public class GraphCoordinator: SplitViewCoordinator<ModuleDependencies>, StoryBoardLoadable {

    // MARK: - Public -

    public override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    public override func splitViewDidResizeSubviews(_ notification: Notification) {
        for splitViewItem in splitViewItems {
            switch splitViewItem.viewController {
            case is PaneCoordinator:
                didSetRightPane(self, visible: !splitViewItem.isCollapsed)
            default:
                break
            }
        }
    }

    // MARK: - Internal -

    enum Pane {
        case right
    }

    func setPane(visible: Bool, pane: Pane, animated: Bool) {
        switch pane {
        case .right:
            if animated {
                splitViewItems.first(where: { $0.viewController is PaneCoordinator })?.animator().isCollapsed = !visible
            } else {
                splitViewItems.first(where: { $0.viewController is PaneCoordinator })?.isCollapsed = !visible
            }
        }
    }

    // MARK: - Private -

    private let settings: Settings = Settings.createSettings()

    private func setUp() {
        dependencies = ModuleDependencies(settings: settings)
        splitView.delegate = self
        add(coordinator: NodeViewCoordinator.createFromStoryBoard())
        let paneCoordinator = PaneCoordinator.createFromStoryBoard()
        add(coordinator: paneCoordinator, canCollapse: true)
        let settingsCoordinator = SettingsCoordinator.createFromStoryBoard()
        let bundle = Bundle.module
        let forceImage = bundle.image(forResource: "ForceTabbarIcon")!
        let visibilityImage = bundle.image(forResource: "VisibilityTabbarIcon")!
        paneCoordinator.transition(toCoordinator: settingsCoordinator, withTabImages: [forceImage, visibilityImage])
    }

}
