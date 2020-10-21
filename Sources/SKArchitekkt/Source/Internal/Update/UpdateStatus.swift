// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import Combine

class UpdateStatus: ObservableObject {
    
    // MARK: - Internal -
    
    @Published private(set) var description: String
    @Published private(set) var progress: Double
    
    init(description: String, progress: Double) {
        self.description = description
        self.progress = progress
    }
    
    func set(description: String, progress: Double) {
        self.description = description
        self.progress = progress
    }
}
