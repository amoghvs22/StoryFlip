//
//  CustomCell.swift
//  StoryFlip
//
//  Created by Mac Mini on 07/10/17.
//  Copyright © 2017 Borqs. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
        //        self.imageView = UIImageView(image:UIImage(named: "placeholder"))
        //        self.imageView?.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        //        self.imageView?.layer.cornerRadius = 100/2
        //        self.addSubview(imageView!)
        //        self.layer.cornerRadius = 100/2
        //
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
