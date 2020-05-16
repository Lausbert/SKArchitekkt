// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation

public struct ModuleDependencies: NoDependencies & HasSettings {
    let settings: Settings
}

protocol NoDependencies {
    // no requirements
}

protocol HasSettings {
    var settings: Settings { get }
}
