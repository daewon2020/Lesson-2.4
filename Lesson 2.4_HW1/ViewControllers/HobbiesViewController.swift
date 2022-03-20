//
//  HobbiesViewController.swift
//  Lesson 2.4_HW1
//
//  Created by Kostya on 20.03.2022.
//

import UIKit

class HobbiesViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var hobbyText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = hobbyText {
            textView.text = text
        } else {
            textView.text = "I don't have hobbies"
        }
    }
}
