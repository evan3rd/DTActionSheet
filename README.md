# DTActionSheet

[![Swift](https://img.shields.io/badge/Swift-3.0-ff3f26.svg?style=flat)](https://swift.org/)
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

```swift
protocol DatePickerSheetDelegate {
  func datePickerSheet(_ sheet: DatePickerSheet, didSaveDate date: Date)
}

class DatePickerSheet: DTSavableActionSheet {
  
  override var contentViewHeight: CGFloat {
    return 250
  }
  
  var delegate: DatePickerSheetDelegate?
  
  fileprivate let datePicker = UIDatePicker()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    super.init(style: .transparent)
    
    contentView.backgroundColor = UIColor.red
    
    saveButton.addTarget(self, action: #selector(save), for: UIControlEvents.touchUpInside)
    layoutDatePicker()
  }
  
  func save() {
    cancel()
    delegate?.datePickerSheet(self, didSaveDate: datePicker.date)
  }
  
  // MARK: - Private
  
  fileprivate func layoutDatePicker() {
    datePicker.datePickerMode = .date
    
    contentView.addSubview(datePicker)
    
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    
    let bottom = NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0)
    let centerX = NSLayoutConstraint(item: datePicker, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
    
    contentView.addConstraints([bottom, centerX])
  }
  
}
```

### Use

```swift
class ViewController: UIViewController {
  
  @IBOutlet weak var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func changeDate(_ sender: AnyObject) {
    let sheet = DatePickerSheet()
    sheet.delegate = self
    sheet.show()
  }
  
}

// MARK: - DatePickerSheetDelegate

extension ViewController: DatePickerSheetDelegate {
  
  func datePickerSheet(_ sheet: DatePickerSheet, didSaveDate date: Date) {
    button.setTitle(date.description, for: .normal)
  }

}
```
