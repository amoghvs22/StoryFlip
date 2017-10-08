//
//  CustomCell.swift
//  StoryFlip
//
//  Created by Mac Mini on 07/10/17.
//  Copyright © 2017 Borqs. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    var info: UserInfo?
    var cellImage: UIImageView!
    var label: UILabel!
    func setupCell() {
        cellImage = UIImageView()
        cellImage.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height - 20.0)
        cellImage.contentMode = .scaleAspectFill
        cellImage.isUserInteractionEnabled = true
        let imageSize = CGSize(width: 73, height: 73)
        let data = UIImageJPEGRepresentation((info?.profileImage!)!, 1.0)
        cellImage.image = UIImage.init(data: data!)?.makeCornerRadius(imageSize: imageSize)
        
        label = UILabel(frame: CGRect(x: 0.0, y: cellImage.frame.size.height + 5.0, width:self.frame.size.width, height: 15.0))
        label.text = info?.userName!
        self.addSubview(cellImage)
        self.addSubview(label)
    }
}
