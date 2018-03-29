# DTActionSheet

[![Swift](https://img.shields.io/badge/Swift-4.0-ff3f26.svg?style=flat)](https://swift.org/)
[![Platform](https://img.shields.io/cocoapods/p/DTActionSheet.svg?style=flat)](http://cocoadocs.org/docsets/DTActionSheet)
[![CocoaPods](http://img.shields.io/cocoapods/v/DTActionSheet.svg)](https://cocoapods.org/pods/DTActionSheet)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Introduction

Simple customizable action sheet.

![Demo](Demo.gif)

## Installation

### Requirement

iOS 8.4+

### [CocoaPods](http://cocoapods.org)

To install DTActionSheet add a dependency to your Podfile:

```
pod "DTActionSheet"
```

### [Carthage](https://github.com/Carthage/Carthage)

To install DTActionSheet add a dependency to your Cartfile:

```
github "danjiang/DTActionSheet"
```

```
carthage update --platform ios
```

## Usage

### Import

```swift
import DTActionSheet
```

### Inheritance

Subclass following 3 classes with subtle differences:

* DTActionSheet - Full customizable
* DTDismissibleActionSheet - With dismiss button on the left
* DTSavableActionSheet - With dismiss button on the left and save button on the right

You can review source code of `DTDatePickerSheet` to know how to write your own action sheet.

### Reusable Components

* DTDatePickerSheet - UIDatePicker in action sheet.
* More to come...

### Use

```swift
class ViewController: UIViewController {
  
  private let formatter = DateFormatter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    formatter.dateStyle = .short
  }

  @IBAction func changeDate(_ sender: UIButton) {
    let sheet = DTDatePickerSheet(style: .dark)
    sheet.setTitle("Choose Date")
    sheet.configDatePicker(mode: .date, date: Date()) { [unowned self] date in
      let title = self.formatter.string(from: date)
      sender.setTitle(title, for: .normal)
    }
    sheet.show()
  }
  
}
```
