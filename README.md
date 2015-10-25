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

### Example App

Check out the example app in the project.
![Example App](/KGNAutoLayoutExample.gif)

### Pin: Superview

![pinToEdgesOfSuperview_offset20](Example/Snapshots/pinToEdgesOfSuperview_offset20.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.pinToEdgesOfSuperview(offset: 20)
```
--


![pinToTopEdgeOfSuperview_offset20](Example/Snapshots/pinToTopEdgeOfSuperview_offset20.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.pinToTopEdgeOfSuperview(offset: 20)

view.centerHorizontallyInSuperview()
view.sizeToWidthAndHeight(160)
```
--


![pinToRightEdgeOfSuperview_offset20](Example/Snapshots/pinToRightEdgeOfSuperview_offset20.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.pinToRightEdgeOfSuperview(offset: 20)

view.centerVerticallyInSuperview()
view.sizeToWidthAndHeight(160)
```
--


![pinToBottomEdgeOfSuperview_offset20](Example/Snapshots/pinToBottomEdgeOfSuperview_offset20.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.pinToBottomEdgeOfSuperview(offset: 20)

view.centerHorizontallyInSuperview()
view.sizeToWidthAndHeight(160)
```
--


![pinToLeftEdgeOfSuperview_offset20](Example/Snapshots/pinToLeftEdgeOfSuperview_offset20.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.pinToLeftEdgeOfSuperview(offset: 20)

view.centerVerticallyInSuperview()
view.sizeToWidthAndHeight(160)
```
--


![pinToSideEdgesOfSuperview_offset20](Example/Snapshots/pinToSideEdgesOfSuperview_offset20.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.pinToSideEdgesOfSuperview(offset: 20)

view.centerVerticallyInSuperview()
view.sizeToHeight(100)
```
--


![pinToTopAndBottomEdgesOfSuperview_offset20](Example/Snapshots/pinToTopAndBottomEdgesOfSuperview_offset20.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.pinToTopAndBottomEdgesOfSuperview(offset: 20)

view.centerHorizontallyInSuperview()
view.sizeToWidth(100)
```
--

### Pin: Edges

![pinTopEdgeToTopEdgeOfItem_offset20](Example/Snapshots/pinTopEdgeToTopEdgeOfItem_offset20.png)
``` Swift
let itemView = ItemView()
parentView.addSubview(itemView)
itemView.pinToLeftEdgeOfSuperview()
itemView.centerVerticallyInSuperview()
itemView.sizeToWidthAndHeight(60)

let view = LayoutView()
parentView.addSubview(view)

view.pinTopEdgeToTopEdgeOfItem(itemView, offset: 20)

view.centerHorizontallyInSuperview()
view.sizeToWidth(40)
view.sizeToHeight(80)
```
--


![pinRightEdgeToRightEdgeOfItem_offset20](Example/Snapshots/pinRightEdgeToRightEdgeOfItem_offset20.png)
``` Swift
let itemView = ItemView()
parentView.addSubview(itemView)
itemView.pinToTopEdgeOfSuperview()
itemView.centerHorizontallyInSuperview()
itemView.sizeToWidthAndHeight(60)

let view = LayoutView()
parentView.addSubview(view)

view.pinRightEdgeToRightEdgeOfItem(itemView, offset: 20)

view.centerVerticallyInSuperview()
view.sizeToWidth(80)
view.sizeToHeight(40)
```
--


![pinBottomEdgeToBottomEdgeOfItem_offset20](Example/Snapshots/pinBottomEdgeToBottomEdgeOfItem_offset20.png)
``` Swift
let itemView = ItemView()
parentView.addSubview(itemView)
itemView.pinToLeftEdgeOfSuperview()
itemView.centerVerticallyInSuperview()
itemView.sizeToWidthAndHeight(60)

let view = LayoutView()
parentView.addSubview(view)

view.pinBottomEdgeToBottomEdgeOfItem(itemView, offset: 20)

view.centerHorizontallyInSuperview()
view.sizeToWidth(40)
view.sizeToHeight(80)
```
--


![pinLeftEdgeToLeftEdgeOfItem_offset20](Example/Snapshots/pinLeftEdgeToLeftEdgeOfItem_offset20.png)
``` Swift
let itemView = ItemView()
parentView.addSubview(itemView)
itemView.pinToTopEdgeOfSuperview()
itemView.centerHorizontallyInSuperview()
itemView.sizeToWidthAndHeight(60)

let view = LayoutView()
parentView.addSubview(view)

view.pinLeftEdgeToLeftEdgeOfItem(itemView, offset: 20)

view.centerVerticallyInSuperview()
view.sizeToWidth(80)
view.sizeToHeight(40)
```
--

### Center

![centerInSuperview](Example/Snapshots/centerInSuperview.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.centerInSuperview()

view.sizeToWidthAndHeight(160)
```
--


![centerHorizontallyInSuperview](Example/Snapshots/centerHorizontallyInSuperview.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.centerHorizontallyInSuperview()

view.pinToTopEdgeOfSuperview()
view.sizeToWidthAndHeight(160)
```
--


![centerVerticallyInSuperview](Example/Snapshots/centerVerticallyInSuperview.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.centerVerticallyInSuperview()

view.pinToLeftEdgeOfSuperview()
view.sizeToWidthAndHeight(160)
```
--


![centerViewsHorizontally](Example/Snapshots/centerViewsHorizontally.png)
``` Swift
let view1 = UIView()
parentView.addSubview(view1)
view1.centerVerticallyInSuperview()
view1.sizeToWidthAndHeight(60)

let view2 = UIView()
parentView.addSubview(view2)
view2.centerVerticallyInSuperview()
view2.sizeToWidthAndHeight(80)

let view3 = UIView()
parentView.addSubview(view3)
view3.centerVerticallyInSuperview()
iew3.sizeToWidthAndHeight(50)

parentView.centerViewsHorizontally([view1, view2, view3])
```
--


![centerViewsVertically](Example/Snapshots/centerViewsVertically.png)
``` Swift
let view1 = UIView()
parentView.addSubview(view1)
view1.centerHorizontallyInSuperview()
view1.sizeToWidthAndHeight(60)

let view2 = UIView()
parentView.addSubview(view2)
view2.centerHorizontallyInSuperview()
view2.sizeToWidthAndHeight(80)

let view3 = UIView()
parentView.addSubview(view3)
view3.centerHorizontallyInSuperview()
iew3.sizeToWidthAndHeight(50)

parentView.centerViewsVertically([view1, view2, view3])
```
--

### Size

![sizeToWidth80](Example/Snapshots/sizeToWidth80.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.sizeToWidth(80)

view.sizeToHeight(100)
view.centerInSuperview()
```
--


![sizeToHeight80](Example/Snapshots/sizeToHeight80.png)
``` Swift
let view = UIView()
parentView.addSubview(view)

view.sizeToHeight(80)

view.sizeToWidth(100)
view.centerInSuperview()
```
--

## TODO:
- [X] Travis
- [X] Badges
- [X] Tests
- [X] Carthage
- [ ] CocoaPods (Just need to release)
- [ ] Description (Give examples)
- [X] Documentation
- [X] Example App
