import SwiftUI

/// Vertical split view which enable with drag gesture cover bottom View under top View
public struct VerticalSplitView<TopView: View, BottomView: View, DividerView: View>: View {
    
    // MARK: - Private properties
    private let topView: TopView
    private let dividerView: DividerView
    private let bottomView: BottomView
    private let split: CGFloat
    @State private var dividerOffset: CGFloat = 0
    
    /// Create VerticalSplitView
    /// - Parameters:
    ///   - split: Number from 0 to 1  when top vs bottom screen should be split
    ///   - topView: View above the divider
    ///   - bottomView: View under the divider
    ///   - dividerView: Divider view between top and under views
    public init(
        split: CGFloat = 0.5,
        @ViewBuilder topView: () -> TopView,
        @ViewBuilder bottomView: () -> BottomView,
        @ViewBuilder dividerView: () -> DividerView
    ) {
        self.split = split
        self.topView = topView()
        self.bottomView = bottomView()
        self.dividerView = dividerView()
    }
    
    // MARK: - View
    
    public var body: some View {
        GeometryReader { reader in
            VStack(spacing: 0) {
                topView
                    .frame(
                        height: max(
                            0,
                            (reader.size.height * split) + dividerOffset
                        )
                    )
                
                dividerView
                    .gesture(
                        DragGesture().onChanged { action in
                            self.dividerOffset += action.translation.height
                        }.onEnded { _ in
                            let splitHeight = reader.size.height * split
                            let splitOffset = splitHeight / 2
                            let shouldExtend = dividerOffset < -(splitHeight - splitOffset)
                            let offset = shouldExtend ? -splitHeight : 0
                            withAnimation {
                                self.dividerOffset = offset
                            }
                        })
                
                bottomView
            }
        }
    }
}

// MARK: - Preview

struct VerticalSplitView_Previews: PreviewProvider {
    static var previews: some View {
            VerticalSplitView(
                split: 0.5,
                topView: { Color.red },
                bottomView: { Color.blue },
                dividerView: {
                    ZStack {
                        Color.green.frame(height: 50)
                        Text("0.5").font(.title)
                    }
                }
            )
        
        VerticalSplitView(
            split: 0.25,
            topView: { Color.red },
            bottomView: { Color.blue },
            dividerView: {
                ZStack {
                    Color.green.frame(height: 50)
                    Text("0.25").font(.title)
                }
            }
        )
        
        VerticalSplitView(
            split: 0.75,
            topView: { Color.red },
            bottomView: { Color.blue },
            dividerView: {
                ZStack {
                    Color.green.frame(height: 50)
                    Text("0.75").font(.title)
                }
            }
        )
        
        VerticalSplitView(
            split: 1,
            topView: { Color.red },
            bottomView: { Color.blue },
            dividerView: {
                ZStack {
                    Color.green.frame(height: 50)
                    Text("1.0").font(.title)
                }
            }
        )
    }
}
