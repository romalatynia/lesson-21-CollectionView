//
//  Information.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import Foundation
import UIKit

struct Shares {
    var image: UIImage
    
    static func setupShares() -> [Shares] {
       let imageshare1 = Shares(image: UIImage(named: "image2") ?? UIImage())
       let imageshare2 = Shares(image: UIImage(named: "image3") ?? UIImage())
       let imageshare3 = Shares(image: UIImage(named: "image4") ?? UIImage())
       let imageshare4 = Shares(image: UIImage(named: "image5") ?? UIImage())

       return [imageshare1, imageshare2, imageshare3, imageshare4]
   }
    
    static func setupAdvertisign() -> [Shares] {
       let imageAdvertisign1 = Shares(image: UIImage(named: "image4") ?? UIImage())
       let imageAdvertisign2 = Shares(image: UIImage(named: "image5") ?? UIImage())

       return [imageAdvertisign1, imageAdvertisign2]
   }
}

struct Phone {
    var name: String
    var price: Float
    var image: UIImage
}

struct Shoping {
 
    static func setup() -> [Phone] {
        let phone1 = Phone(name: "Mi", price: 599.9, image: UIImage(named: "image1") ?? UIImage())
        let phone2 = Phone(name: "Sumsung", price: 499.9, image: UIImage(named: "image1") ?? UIImage())
        let phone3 = Phone(name: "iPhone", price: 1000, image: UIImage(named: "image1") ?? UIImage())
        let phone4 = Phone(name: "Huawei", price: 300, image: UIImage(named: "image1") ?? UIImage())
        let phone5 = Phone(name: "Poco", price: 299.9, image: UIImage(named: "image1") ?? UIImage())
        let phone6 = Phone(name: "iPhone", price: 799.9, image: UIImage(named: "image1") ?? UIImage())
        let phone7 = Phone(name: "Sumsung", price: 699.9, image: UIImage(named: "image1") ?? UIImage())
        let phone8 = Phone(name: "Mi", price: 1599.9, image: UIImage(named: "image1") ?? UIImage())
        let phone9 = Phone(name: "iPhone", price: 1000.9, image: UIImage(named: "image1") ?? UIImage())
        let phone10 = Phone(name: "Mi", price: 999.9, image: UIImage(named: "image1") ?? UIImage())
        let phone11 = Phone(name: "Huawei", price: 599.9, image: UIImage(named: "image1") ?? UIImage())
        let phone12 = Phone(name: "Huawei", price: 499.9, image: UIImage(named: "image1") ?? UIImage())
        let phone13 = Phone(name: "Poco", price: 1000, image: UIImage(named: "image1") ?? UIImage())
        let phone14 = Phone(name: "Sumsung", price: 300, image: UIImage(named: "image1") ?? UIImage())
        let phone15 = Phone(name: "Mi", price: 299.9, image: UIImage(named: "image1") ?? UIImage())
        let phone16 = Phone(name: "iPhone", price: 799.9, image: UIImage(named: "image1") ?? UIImage())
        let phone17 = Phone(name: "Poco", price: 699.9, image: UIImage(named: "image1") ?? UIImage())
        let phone18 = Phone(name: "Sumsung", price: 1599.9, image: UIImage(named: "image1") ?? UIImage())
        let phone19 = Phone(name: "Mi", price: 1000.9, image: UIImage(named: "image1") ?? UIImage())
        let phone20 = Phone(name: "iPhone", price: 999.9, image: UIImage(named: "image1") ?? UIImage())

        return [
            phone1,
            phone2,
            phone3,
            phone4,
            phone5,
            phone6,
            phone7,
            phone8,
            phone9,
            phone10,
            phone11,
            phone12,
            phone13,
            phone14,
            phone15,
            phone16,
            phone17,
            phone18,
            phone19,
            phone20
        ]
    }
}
