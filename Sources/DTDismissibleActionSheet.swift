//
//  DTDismissibleActionSheet.swift
//  DTActionSheet
//
//  Created by Dan Jiang on 2017/6/18.
//
//

import UIKit

open class DTDismissibleActionSheet: DTActionSheet {

  public let dismissButton = UIButton()

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override init(style: DTActionSheetStyle) {
    super.init(style: style)
    
    layoutDismissButton()
  }
  
  fileprivate func layoutDismissButton() {
    dismissButton.tintColor = UIColor.white
    dismissButton.setImage(DTActionSheet.imageWithName("dismiss")?.withRenderingMode(.alwaysTemplate), for: .normal)
    dismissButton.addTarget(self, action: #selector(dismiss), for: UIControlEvents.touchUpInside)
    
    contentView.addSubview(dismissButton)
    
    dismissButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = NSLayoutConstraint(item: dismissButton, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 15)
    let leading = NSLayoutConstraint(item: dismissButton, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 15)
    
    contentView.addConstraints([top, leading])
  }

}
