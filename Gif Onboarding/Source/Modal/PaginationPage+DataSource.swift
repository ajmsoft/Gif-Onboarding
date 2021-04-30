//
//  PaginationPage+DataSource.swift
//  Gif Onboarding
//
//  Created by AJM Softwares on 19/03/21.
//

import UIKit
extension PaginationPage {
    func getAnimation1Image() -> [UIImage] {
        var images : [UIImage] = []
        for index in 1...119 {
            if let image = UIImage(named: "animation_\(index)") {
                images.append(image.forceLoad())
            }
        }
        return images
    }
}
