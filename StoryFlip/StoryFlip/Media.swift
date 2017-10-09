//
//  Media.swift
//  StoryFlip
//
//  Created by Mac Mini on 09/10/17.
//  Copyright © 2017 Borqs. All rights reserved.
//

import UIKit

public enum Type: Int {
    case Video = 1
    case Photo = 2
}


class Media: NSObject {
    var duration: Int?
    var mediaType: Type?
    var imageURL: URL?
    
    
    init(url: String, type: Type, duration: Int?) {
        if(duration !=  nil) {
            self.duration = duration
        }
        self.mediaType = type
        if(type == .Video) {
            let tuple = VideoConversion().getFrame(url: URL(fileURLWithPath: url))
            self.imageURL = tuple.0
            self.duration = tuple.1
        }
        else {
            self.imageURL = URL(fileURLWithPath: url)
        }
    }
}
