# VerticalSplitView

[![SPM Compatible](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
![Platforms: iOS](https://img.shields.io/badge/platforms-iOS-brightgreen.svg?style=flat)

`VerticalSplitView` Show two views (top, bottom) separeted with divider view. With drag gesture on divider view user can extend the bottom view under the top view.

### TODO list
- [ ] Add binding for extend topView

### Installation

As a Swift Package

`VerticalSplitView` is distributed via SPM. In your `Package.swift` add a new package dependency:

```swift
.package(
    url: "https://github.com/jantimar/VerticalSplitView",
    from: "0.1.0"
)
```

### Usage

```swift
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
```

![0.5](/assets/0.5.gif)

```swift
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
```

![0.75](/assets/0.75.gif)

## License and Credits

**VerticalSplitView** is released under the MIT license. See [LICENSE](/LICENSE) for details.

Created by [Jan Timar](https://github.com/jantimar).
