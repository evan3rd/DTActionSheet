//
//  DTDatePickerSheet.swift
//  DTActionSheet iOS
//
//  Created by Dan Jiang on 2018/3/29.
//

import UIKit

public final class DTDatePickerSheet: DTSavableActionSheet {
    
    public typealias Action = (Date) -> Void
    
    public override var contentViewHeight: CGFloat {
        return 260
    }
    
    private let datePicker = UIDatePicker()
    private var action: Action?
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(style: DTActionSheetStyle) {
        super.init(style: style)
        
        contentView.backgroundColor = .white
        
        dismissButton.tintColor = UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.00)
        saveButton.tintColor = UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.00)
        saveButton.addTarget(self, action: #selector(save), for: UIControlEvents.touchUpInside)
        
        layoutDatePicker()
    }
    
    @objc func save() {
        cancel()
        if let action = action {
            action(datePicker.date)
        }
    }
    
    public func configDatePicker(mode: UIDatePickerMode, date: Date?, minimumDate: Date? = nil, maximumDate: Date? = nil, backgroundColor: UIColor = .clear, textColor: UIColor = .darkText, action: Action?) {
        datePicker.datePickerMode = mode
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        datePicker.backgroundColor = backgroundColor
        datePicker.setValue(textColor, forKey: "textColor")
        self.action = action        
    }
    
    // MARK: - Private
    
    private func layoutDatePicker() {
        datePicker.datePickerMode = .date
        
        contentView.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let bottom = NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: datePicker, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
        
        contentView.addConstraints([bottom, centerX])
    }
    
}
