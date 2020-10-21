// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import Combine

class UpdateStatus: ObservableObject {
    
    // MARK: - Internal -
    
    init(description: String, progress: Double) {
        self.description = description
        self.progress = progress
    }
    
    @Published private(set) var description: String
    @Published private(set) var progress: Double
    
    func set(description: String, progress: Double) {
        self.description = description
        self.progress = progress
    }
}
