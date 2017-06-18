//
//  DatePickerSheet.swift
//  DTActionSheet
//
//  Created by Dan Jiang on 16/10/15.
//
//

import UIKit
import DTActionSheet

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
