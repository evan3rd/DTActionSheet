//
//  DTActionSheet.swift
//  DTActionSheet
//
//  Created by Dan Jiang on 16/10/14.
//
//

import UIKit

public enum DTActionSheetStyle {
  case transparent
  case dark
  case extraLightBlur
  case lightBlur
  case darkBlur
}

open class DTActionSheet: UIView {

  public static func imageWithName(_ name: String) -> UIImage? {
    let bundle = Bundle(for: DTActionSheet.self)
    let url = bundle.url(forResource: "DTActionSheet", withExtension: "bundle")!
    let imageBundle = Bundle(url: url)
    return UIImage(named: name, in: imageBundle, compatibleWith: nil)
  }
  
  open var contentViewHeight: CGFloat {
    return 200
  }
  public let contentView = UIView()
  
  fileprivate let style: DTActionSheetStyle
  fileprivate var overlayView: UIView!
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public init(style: DTActionSheetStyle) {
    self.style = style
    
    super.init(frame: .zero)
    
    layoutOverlayView()
    layoutContentView()
  }
  
  // MARK: - Actions
  
  public func show() {
    if let w = UIApplication.shared.delegate?.window, let window = w {
      frame = window.frame
      window.addSubview(self)
      
      let width = frame.width
      let height = frame.height
      
      contentView.frame = CGRect(x: 0, y: height + contentViewHeight, width: width, height: contentViewHeight)
      overlayView.alpha = 0
      UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut], animations: { 
        self.overlayView.alpha = 1
      }, completion: nil)
      UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut], animations: {
        self.contentView.frame = CGRect(x: 0, y: height - self.contentViewHeight, width: width, height: self.contentViewHeight)
      }, completion: nil)
    }
  }
  
  public func dismiss() {
    let width = frame.width
    let height = frame.height
    
    UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut], animations: {
      self.overlayView.alpha = 0
    }, completion: nil)
    UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseIn], animations: {
      self.contentView.frame = CGRect(x: 0, y: height + self.contentViewHeight, width: width, height: self.contentViewHeight)
    }) { (finished) in
      self.removeFromSuperview()
    }
  }
  
  public func cancel() {
    removeFromSuperview()
  }
  
  // MARK: - Private
  
  fileprivate func layoutOverlayView() {
    switch style {
    case .transparent:
      overlayView = UIView()
      overlayView.backgroundColor = UIColor(white: 0, alpha: 0)
    case .dark:
      overlayView = UIView()
      overlayView.backgroundColor = UIColor(white: 0, alpha: 0.65)
    case .extraLightBlur:
      let blurEffect = UIBlurEffect(style: .extraLight)
      overlayView = UIVisualEffectView(effect: blurEffect)
    case .lightBlur:
      let blurEffect = UIBlurEffect(style: .light)
      overlayView = UIVisualEffectView(effect: blurEffect)
    case .darkBlur:
      let blurEffect = UIBlurEffect(style: .dark)
      overlayView = UIVisualEffectView(effect: blurEffect)
    }
    
    overlayView.isUserInteractionEnabled = true
    overlayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismiss)))

    addSubview(overlayView)
    
    overlayView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = NSLayoutConstraint(item: overlayView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
    let bottom = NSLayoutConstraint(item: overlayView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
    let leading = NSLayoutConstraint(item: overlayView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
    let trailing = NSLayoutConstraint(item: overlayView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
    
    addConstraints([top, bottom, leading, trailing])
  }
  
  fileprivate func layoutContentView() {
    addSubview(contentView)

    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    let bottom = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
    let leading = NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
    let trailing = NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
    let height = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: contentViewHeight)

    addConstraints([bottom, leading, trailing, height])
  }

}
