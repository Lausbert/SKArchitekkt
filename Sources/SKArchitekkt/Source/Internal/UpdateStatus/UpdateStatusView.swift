// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct UpdateStatusView<AccessoryView: View>: View {
    
    // MARK: - Internal -
    
    @ObservedObject var updateStatus: UpdateStatus
    
    init(updateStatus: UpdateStatus, @ViewBuilder accessoryView: @escaping () -> AccessoryView) {
        self.updateStatus = updateStatus
        self.accessoryView = accessoryView
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Text(updateStatus.description)
                    .font(.subheadline)
                Spacer()
                accessoryView()
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            VStack {
                Spacer()
                ProgressIndicator(doubleValue: updateStatus.progress)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: -9, trailing: 0))
            }
        }
        .frame(minWidth: 360)
        .background(Color(NSColor.separatorColor))
        .cornerRadius(5.0)
    }
    
    // MARK: - Private -
    
    private let accessoryView: () -> AccessoryView
    
}
