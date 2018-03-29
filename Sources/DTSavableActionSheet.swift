//
//  DTSavableActionSheet.swift
//  DTActionSheet
//
//  Created by Dan Jiang on 2017/6/18.
//
//

import UIKit

open class DTSavableActionSheet: DTDismissibleActionSheet {

  public let saveButton = UIButton()
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override init(style: DTActionSheetStyle) {
    super.init(style: style)
    
    layoutSaveButton()
  }
  
  private func layoutSaveButton() {
    saveButton.tintColor = UIColor.white
    saveButton.setImage(DTActionSheet.imageWithName("save")?.withRenderingMode(.alwaysTemplate), for: .normal)
    
    contentView.addSubview(saveButton)
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = NSLayoutConstraint(item: saveButton, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 15)
    let trailing = NSLayoutConstraint(item: saveButton, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -15)
    
    contentView.addConstraints([top, trailing])
  }

}
