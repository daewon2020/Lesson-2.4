//
//  User.swift
//  Lesson 2.4_HW1
//
//  Created by Kostya on 16.03.2022.
//

import UIKit

struct User {
    let login: String
    let pass: String
    let avatar: UIImage?
    let person: Person
    let gallery: [String]
    
    static func getUser() -> User {
        User(
            login: "Kostya",
            pass: "Password",
            avatar: UIImage(named: "Avatar"),
            person: Person(
                name: "Kostya",
                surname: "Andreev",
                email: "daewon@yandex.ru",
                hobbies: [
                    .running,
                    .snowboarding,
                    .training
                ],
                socialMedias: [
                    SocialMedia(name: "Telegram", link: "@const_An"),
                    SocialMedia(name: "Instagram", link: "andreev_k")
                ]
            ),
            gallery: [
                 "Image1",
                 "Image2",
                 "Image3",
                 "Image4",
                 "Image5",
                 "Image6"
            ]
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let email: String
    let hobbies: [Hobby]
    let socialMedias: [SocialMedia]
    
    var fullName: String {
        name + " " + surname
    }
    var fullEmail: String {
        "Email: " + email
    }
}

struct SocialMedia {
    let name: String
    let link: String
    var string: String {
        name + ": " + link
    }
}

enum Hobby: Character {
    case running = "🏃"
    case drawing = "🎨"
    case snowboarding = "🏂"
    case swimming = "🏊‍♂️"
    case reading = "📖"
    case training = "🏋️"
    case cycling = "🚵‍♀️"
    case cooking = "🍽"
}


