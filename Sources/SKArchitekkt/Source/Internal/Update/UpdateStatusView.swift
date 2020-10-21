// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct UpdateStatusView: View {
    
    @ObservedObject var updateStatus: UpdateStatus
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(updateStatus.description)
                .font(.subheadline)
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
}
