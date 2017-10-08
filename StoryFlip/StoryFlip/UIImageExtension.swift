//
//  UIImageExtension.swift
//  StoryFlip
//
//  Created by Mac Mini on 08/10/17.
//  Copyright © 2017 Borqs. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func makeCornerRadius(imageSize:CGSize) -> UIImage
    {
        let rect = CGRect(origin: .zero , size: imageSize)
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 2.0)
        UIBezierPath.init(roundedRect:rect , cornerRadius:imageSize.width/2).addClip()
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
