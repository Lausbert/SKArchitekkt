// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct WarningAccessoryView: View {
    
    // MARK: - Internal -
    
    let warnings: [String]
        
    var body: some View {
        if warnings.isEmpty {
            EmptyView()
        } else {
            Button(action: {
                isShowingPopover.toggle()
            }, label: {
                HStack(spacing: 4) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.warningColor)
                        .popover(isPresented: $isShowingPopover, attachmentAnchor: .point(.bottom), arrowEdge: .bottom, content: {
                            List(warnings, id: \.self) { warning in
                                VStack {
                                    Text(warning)
                                        .font(.subheadline)
                                    Divider()
                                }
                            }
                        })
                    Text("\(warnings.count)")
                        .font(.subheadline)
                }
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    // MARK: - Private -
    
    @State private var isShowingPopover = false
}
