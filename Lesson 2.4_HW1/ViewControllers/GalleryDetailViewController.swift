//
//  GalleryDetailViewController.swift
//  Lesson 2.4_HW1
//
//  Created by Kostya on 19.03.2022.
//

import UIKit

class GalleryDetailViewController: UIViewController {

    @IBOutlet var detailImage: UIImageView!
    
    var imageFullSize: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: imageFullSize) {
            detailImage.image = image
        }
    }
    
}
