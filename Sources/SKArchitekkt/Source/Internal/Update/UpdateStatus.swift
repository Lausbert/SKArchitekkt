// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import Combine

class UpdateStatus: ObservableObject {
    
    // MARK: - Internal -
    
    static func create(id: UUID, description: String, progress: Double) -> UpdateStatus {
        let updateStatus = pool[id] ?? UpdateStatus(description: description, progress: progress)
        pool[id] = updateStatus
        return updateStatus
    }
    
    @Published private(set) var description: String
    @Published private(set) var progress: Double
    
    func set(description: String, progress: Double) {
        self.description = description
        self.progress = progress
    }
    
    // MARK: - Private -
    
    private static var pool: [UUID: UpdateStatus] = [:]
    
    private init(description: String, progress: Double) {
        self.description = description
        self.progress = progress
    }
}
