//
//  ViewController.swift
//  DTActionSheet iOS Example
//
//  Created by Dan Jiang on 16/10/14.
//
//

import UIKit
import DTActionSheet

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
