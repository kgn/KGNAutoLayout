# KGNAutoLayout

`KGNAutoLayout` makes `AutoLayout` easy!

[![iOS 8.0+](http://img.shields.io/badge/iOS-8.0%2B-blue.svg)]()
[![Xcode 7.1](http://img.shields.io/badge/Xcode-7.1-blue.svg)]()
[![Swift 2.0](http://img.shields.io/badge/Swift-2.0-blue.svg)]()
[![Release](https://img.shields.io/github/release/kgn/KGNAutoLayout.svg)](/releases)
[![Build Status](http://img.shields.io/badge/License-MIT-lightgrey.svg)](/LICENSE)

[![Build Status](https://travis-ci.org/kgn/KGNAutoLayout.svg)](https://travis-ci.org/kgn/KGNAutoLayout)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-Compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/KGNAutoLayout.svg)](https://cocoapods.org/pods/KGNAutoLayout)
[![CocoaPods Platforms](https://img.shields.io/cocoapods/p/KGNAutoLayout.svg)](https://cocoapods.org/pods/KGNAutoLayout)

[![Twitter](https://img.shields.io/badge/Twitter-@iamkgn-55ACEE.svg)](http://twitter.com/iamkgn)
[![Star](https://img.shields.io/github/followers/kgn.svg?style=social&label=Follow%20%40kgn)](https://github.com/kgn)
[![Star](https://img.shields.io/github/stars/kgn/KGNAutoLayout.svg?style=social&label=Star)](https://github.com/kgn/KGNAutoLayout)

## Installing

### Carthage
```
github "kgn/KGNAutoLayout"
```

### CocoaPods
```
pod 'KGNAutoLayout'
```

## Examples

### Pin: Superview

``` Swift
view.pinToEdgesOfSuperview(offset: 10)
```
![pinToEdgesOfSuperview_offset10](Example/Snapshots/pinToEdgesOfSuperview_offset10.png)


``` Swift
view.pinToTopEdgeOfSuperview(offset: 10)

view.centerHorizontallyInSuperview()
view.sizeToWidthAndHeight(80)
```
![pinToTopEdgeOfSuperview_offset10](Example/Snapshots/pinToTopEdgeOfSuperview_offset10.png)


``` Swift
view.pinToRightEdgeOfSuperview(offset: 10)

view.centerHorizontallyInSuperview()
view.sizeToWidthAndHeight(80)
```
![pinToRightEdgeOfSuperview_offset10](Example/Snapshots/pinToRightEdgeOfSuperview_offset10.png)


``` Swift
view.pinToBottomEdgeOfSuperview(offset: 10)

view.centerHorizontallyInSuperview()
view.sizeToWidthAndHeight(80)
```
![pinToBottomEdgeOfSuperview_offset10](Example/Snapshots/pinToBottomEdgeOfSuperview_offset10.png)


``` Swift
view.pinToLeftEdgeOfSuperview(offset: 10)

view.centerHorizontallyInSuperview()
view.sizeToWidthAndHeight(80)
```
![pinToLeftEdgeOfSuperview_offset10](Example/Snapshots/pinToLeftEdgeOfSuperview_offset10.png)


``` Swift
view.pinToSideEdgesOfSuperview(offset: 10)

view.centerVerticallyInSuperview()
```
![pinToSideEdgesOfSuperview_offset10](Example/Snapshots/pinToSideEdgesOfSuperview_offset10.png)


``` Swift
view.pinToTopAndBottomEdgesOfSuperview(offset: 10)

view.centerHorizontallyInSuperview()
```
![pinToTopAndBottomEdgesOfSuperview_offset10](Example/Snapshots/pinToTopAndBottomEdgesOfSuperview_offset10.png)

### Example App

Check out the example app in the project for more examples.
![Example App](/KGNAutoLayoutExample.gif)

## TODO:
- [X] Travis
- [X] Badges
- [X] Tests
- [X] Carthage
- [ ] CocoaPods (Just need to release)
- [ ] Description (Give examples)
- [X] Documentation
- [X] Example App
