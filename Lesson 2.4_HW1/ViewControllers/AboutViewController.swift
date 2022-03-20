//
//  AboutViewController.swift
//  Lesson 2.4_HW1
//
//  Created by Kostya on 18.03.2022.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var avatarImage: UIImageView!
    
    @IBOutlet var nameTF: UILabel!
    @IBOutlet var emailTF: UILabel!
    @IBOutlet var telegramTF: UILabel!
    @IBOutlet var instagramTF: UILabel!
    
    var user: User!
    
    private var label: UILabel!
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGallery" {
            guard let galleryVC = segue.destination as? GalleryCollectionViewController else { return }
            galleryVC.user = user
        }
        
        if segue.identifier == "showHobbies" {
            guard let hobbiesVC = segue.destination as? HobbiesViewController else { return }
            var hobbyText = ""
            var index = 1
            for hobby in user.person.hobbies {
                hobbyText.append("\(index). \(hobby) \(hobby.rawValue)\n")
                index += 1
            }
            
            hobbiesVC.hobbyText = hobbyText
        }
    }
    
    override func viewDidLayoutSubviews() {
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let avatar = user.avatar {
            avatarImage.image = avatar
        }
        
        nameTF.text = user.person.fullName
        emailTF.text = user.person.fullEmail
        
        for socialMedia in user.person.socialMedias {
            if socialMedia.name.lowercased() == "telegram" {
                telegramTF.text = socialMedia.string
            }else {
                instagramTF.text = socialMedia.string
            }
        }
    }
}
