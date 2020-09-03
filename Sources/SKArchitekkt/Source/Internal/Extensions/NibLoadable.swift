//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

protocol NibLoadable {

    static func createFromNib() -> Self

}

extension NSView: NibLoadable {

    public static func createFromNib() -> Self {
        let name = String(describing: Self.self)
        let bundle = Bundle.module
        var topLevelArray: NSArray?
        bundle.loadNibNamed(NSNib.Name(name), owner: self, topLevelObjects: &topLevelArray)
        let views = [Any](topLevelArray!).filter { $0 is Self }
        return views.last as! Self
    }

}

extension NSCollectionViewItem: NibLoadable {

    public static func createFromNib() -> Self {
        let name = String(describing: Self.self)
        let bundle = Bundle.module
        var topLevelArray: NSArray?
        bundle.loadNibNamed(NSNib.Name(name), owner: self, topLevelObjects: &topLevelArray)
        let views = [Any](topLevelArray!).filter { $0 is Self }
        return views.last as! Self
    }

}
