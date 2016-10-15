//
//  ViewController.swift
//  DTActionSheet iOS Example
//
//  Created by Dan Jiang on 16/10/14.
//
//

import UIKit

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

// MARK: -

extension ViewController: DatePickerSheetDelegate {
  
  func datePickerSheet(_ sheet: DatePickerSheet, didSaveDate date: Date) {
    button.setTitle(date.description, for: .normal)
  }

}
