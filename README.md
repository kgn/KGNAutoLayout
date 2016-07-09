# KGNAutoLayout

`KGNAutoLayout` makes `AutoLayout` easy!

[![iOS 8.0+](http://img.shields.io/badge/iOS-8.0%2B-blue.svg)]()
[![Swift 2.0+](http://img.shields.io/badge/Swift-2.0-blue.svg)]()
[![Release](https://img.shields.io/github/release/kgn/KGNAutoLayout.svg)](/releases)
[![License](http://img.shields.io/badge/License-MIT-lightgrey.svg)](/LICENSE)

[![Build Status](https://travis-ci.org/kgn/KGNAutoLayout.svg)](https://travis-ci.org/kgn/KGNAutoLayout)
[![Test Coverage](http://img.shields.io/badge/Tests-98%25-green.svg)]()
[![Carthage Compatible](https://img.shields.io/badge/Carthage-Compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/KGNAutoLayout.svg)](https://cocoapods.org/pods/KGNAutoLayout)
[![CocoaPods Platforms](https://img.shields.io/cocoapods/p/KGNAutoLayout.svg)](https://cocoapods.org/pods/KGNAutoLayout)

[![Twitter](https://img.shields.io/badge/Twitter-@iamkgn-55ACEE.svg)](http://twitter.com/iamkgn)
[![Follow](https://img.shields.io/github/followers/kgn.svg?style=social&label=Follow%20%40kgn)](https://github.com/kgn)
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

![Example App](/KGNAutoLayoutExample.gif)

### Pin: Superview

``` Swift
view.pinToEdgesOfSuperview(offset: 20)
```
![pinToEdgesOfSuperview_offset20](Example/Snapshots/pinToEdgesOfSuperview_offset20.png)
--


``` Swift
view.pinToTopEdgeOfSuperview(offset: 20)
```
![pinToTopEdgeOfSuperview_offset20](Example/Snapshots/pinToTopEdgeOfSuperview_offset20.png)
--


``` Swift
view.pinToRightEdgeOfSuperview(offset: 20)
```
![pinToRightEdgeOfSuperview_offset20](Example/Snapshots/pinToRightEdgeOfSuperview_offset20.png)
--


``` Swift
view.pinToBottomEdgeOfSuperview(offset: 20)
```
![pinToBottomEdgeOfSuperview_offset20](Example/Snapshots/pinToBottomEdgeOfSuperview_offset20.png)
--


``` Swift
view.pinToLeftEdgeOfSuperview(offset: 20)
```
![pinToLeftEdgeOfSuperview_offset20](Example/Snapshots/pinToLeftEdgeOfSuperview_offset20.png)
--


``` Swift
view.pinToSideEdgesOfSuperview(offset: 20)
```
![pinToSideEdgesOfSuperview_offset20](Example/Snapshots/pinToSideEdgesOfSuperview_offset20.png)
--


``` Swift
view.pinToTopAndBottomEdgesOfSuperview(offset: 20)
```
![pinToTopAndBottomEdgesOfSuperview_offset20](Example/Snapshots/pinToTopAndBottomEdgesOfSuperview_offset20.png)
--

### Pin: Edges

``` Swift
view.pinTopEdgeToTopEdge(ofItem: itemView, offset: 20)
```
![pinTopEdgeToTopEdgeOfItem_offset20](Example/Snapshots/pinTopEdgeToTopEdgeOfItem_offset20.png)
--


``` Swift
view.pinRightEdgeToRightEdge(ofItem: itemView, offset: 20)
```
![pinRightEdgeToRightEdgeOfItem_offset20](Example/Snapshots/pinRightEdgeToRightEdgeOfItem_offset20.png)
--


``` Swift
view.pinBottomEdgeToBottomEdge(ofItem: itemView, offset: 20)
```
![pinBottomEdgeToBottomEdgeOfItem_offset20](Example/Snapshots/pinBottomEdgeToBottomEdgeOfItem_offset20.png)
--


``` Swift
view.pinLeftEdgeToLeftEdge(ofItem: itemView, offset: 20)
```
![pinLeftEdgeToLeftEdgeOfItem_offset20](Example/Snapshots/pinLeftEdgeToLeftEdgeOfItem_offset20.png)
--

### Center

``` Swift
view.centerInSuperview()
```
![centerInSuperview](Example/Snapshots/centerInSuperview.png)
--


``` Swift
view.centerHorizontallyInSuperview()
```
![centerHorizontallyInSuperview](Example/Snapshots/centerHorizontallyInSuperview.png)
--


``` Swift
view.centerVerticallyInSuperview()
```
![centerVerticallyInSuperview](Example/Snapshots/centerVerticallyInSuperview.png)
--


``` Swift
parentView.centerHorizontally(views: [view1, view2, view3], separation: 20)
```
![centerViewsHorizontally_separation20](Example/Snapshots/centerViewsHorizontally_separation20.png)
--


``` Swift
parentView.centerVertically(views: [view1, view2, view3], separation: 20)
```
![centerViewsVertically_separation20](Example/Snapshots/centerViewsVertically_separation20.png)
--


``` Swift
view.centerHorizontally(toItem: itemView)
```
![centerHorizontallyToItem](Example/Snapshots/centerHorizontallyToItem.png)
--


``` Swift
view.centerVertically(toItem: itemView)
```
![centerVerticallyToItem](Example/Snapshots/centerVerticallyToItem.png)
--

### Size

``` Swift
view.size(toWidth: 80)
```
![sizeToWidth80](Example/Snapshots/sizeToWidth80.png)
--


``` Swift
view.size(toMinWidth: 40)
```
![sizeToMinWidth40](Example/Snapshots/sizeToMinWidth40.png)
--


``` Swift
view.size(toMaxWidth: 100)
```
![sizeToMaxWidth100](Example/Snapshots/sizeToMaxWidth100.png)
--


``` Swift
view.size(toHeight: 80)
```
![sizeToHeight80](Example/Snapshots/sizeToHeight80.png)
--


``` Swift
view.size(toMinHeight: 40)
```
![sizeToMinHeight40](Example/Snapshots/sizeToMinHeight40.png)
--


``` Swift
view.size(toMaxHeight: 100)
```
![sizeToMaxHeight100](Example/Snapshots/sizeToMaxHeight100.png)
--


``` Swift
view.size(toWidthAndHeight: 80)
```
![sizeToWidthAndHeight80](Example/Snapshots/sizeToWidthAndHeight80.png)
--


``` Swift
view.size(toMinWidthAndHeight: 40)
```
![sizeToMinWidthAndHeight40](Example/Snapshots/sizeToMinWidthAndHeight40.png)
--


``` Swift
view.size(toMaxWidthAndHeight: 100)
```
![sizeToMaxWidthAndHeight100](Example/Snapshots/sizeToMaxWidthAndHeight100.png)
--


``` Swift
view.sizeWidthToWidth(ofItem: itemView)
```
![sizeWidthToWidthOfItem](Example/Snapshots/sizeWidthToWidthOfItem.png)
--


``` Swift
view.sizeHeightToHeight(ofItem: itemView)
```
![sizeHeightToHeightOfItem](Example/Snapshots/sizeHeightToHeightOfItem.png)
--


``` Swift
view.sizeHeightToWidth(ofItem: itemView)
```
![sizeHeightToWidthOfItem](Example/Snapshots/sizeHeightToWidthOfItem.png)
--


``` Swift
view.sizeWidthToHeight(ofItem: itemView)
```
![sizeWidthToHeightOfItem](Example/Snapshots/sizeWidthToHeightOfItem.png)
--


``` Swift
view.sizeWidthAndHeightToWidthAndHeight(ofItem: itemView)
```
![sizeWidthAndHeightToWidthAndHeightOfItem](Example/Snapshots/sizeWidthAndHeightToWidthAndHeightOfItem.png)
--


``` Swift
view.sizeHeightToWidth(withAspectRatio: 16/9)
```
![sizeHeightToWidthAspectRatio16by9](Example/Snapshots/sizeHeightToWidthAspectRatio16by9.png)
--


``` Swift
view.sizeWidthToHeight(withAspectRatio: 16/9)
```
![sizeWidthToHeightAspectRatio16by9](Example/Snapshots/sizeWidthToHeightAspectRatio16by9.png)
--

### Position

``` Swift
view.positionAbove(item: itemView, offset: 20)
```
![positionAboveItem_offset20](Example/Snapshots/positionAboveItem_offset20.png)
--


``` Swift
view.positionToTheRight(ofItem: itemView, offset: 20)
```
![positionToTheRightOfItem_offset20](Example/Snapshots/positionToTheRightOfItem_offset20.png)
--


``` Swift
view.positionBelow(item: itemView, offset: 20)
```
![positionBelowItem_offset20](Example/Snapshots/positionBelowItem_offset20.png)
--


``` Swift
view.positionToTheLeft(ofItem: itemView, offset: 20)
```
![positionToTheLeftOfItem_offset20](Example/Snapshots/positionToTheLeftOfItem_offset20.png)
--


``` Swift
itemView.positionAbove(views: [view1, view2, view3], offset: 20)
```
![positionViewsAbove_offset20](Example/Snapshots/positionViewsAbove_offset20.png)
--


``` Swift
itemView.positionToTheRight(views: [view1, view2, view3], offset: 20)
```
![positionViewsToTheRight_offset20](Example/Snapshots/positionViewsToTheRight_offset20.png)
--


``` Swift
itemView.positionBelow(views: [view1, view2, view3], offset: 20)
```
![positionViewsBelow_offset20](Example/Snapshots/positionViewsBelow_offset20.png)
--


``` Swift
itemView.positionToTheLeft(views: [view1, view2, view3], offset: 20)
```
![positionViewsToTheLeft_offset20](Example/Snapshots/positionViewsToTheLeft_offset20.png)
--

### Between

``` Swift
view.fitBetween(topItem: topView, bottomItem: bottomView, offset: 20)
```
![fitBetweenTopAndBottomItems_offset20](Example/Snapshots/fitBetweenTopAndBottomItems_offset20.png)
--


``` Swift
view.fitBetween(leftItem: leftView, rightItem: rightView, offset: 20)
```
![fitBetweenLeftAndRightItems_offset20](Example/Snapshots/fitBetweenLeftAndRightItems_offset20.png)
--

### Fill

``` Swift
parentView.fillHorizontally(views: [view1, view2, view3], separation: 20)
```
![fillHorizontally_separation20](Example/Snapshots/fillHorizontally_separation20.png)
--


``` Swift
parentView.fillVertically(views: [view1, view2, view3], separation: 20)
```
![fillVertically_separation20](Example/Snapshots/fillVertically_separation20.png)
--

### Bound

``` Swift
itemView.boundHorizontally(views: [view1, view2, view3], separation: 20)
```
![boundHorizontally_separation20](Example/Snapshots/boundHorizontally_separation20.png)
--


``` Swift
itemView.boundVertically(views: [view1, view2, view3], separation: 20)
```
![boundVertically_separation20](Example/Snapshots/boundVertically_separation20.png)

## Progress:
- [X] Travis
- [X] Badges
- [X] Tests
- [X] Carthage
- [X] CocoaPods
- [X] Description
- [X] Documentation
- [X] Example App
- [X] AppleTV
- [X] Prebuilt Frameworks
- [ ] Travis Test Matrix
