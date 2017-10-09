//
//  VideoConversion.swift
//  StoryFlip
//
//  Created by Mac Mini on 09/10/17.
//  Copyright © 2017 Borqs. All rights reserved.
//

import UIKit
import AVFoundation
import CoreGraphics
import CoreMedia
import ImageIO
import MobileCoreServices

class VideoConversion: NSObject {
    var videoFrames = [UIImage]()
    var duration: Int?
    func getFrame(url: URL) -> (URL, Int){
        let asset:AVAsset = AVAsset(url:(url as NSURL) as URL)
        let assetImgGenerate:AVAssetImageGenerator = AVAssetImageGenerator(asset:asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        let duration:Float64 = CMTimeGetSeconds(asset.duration)
        let durationInt:Int = Int(duration)
        self.duration = durationInt
        for index:Int in 0 ..< durationInt
        {
            generateFrames(assetImgGenerate: assetImgGenerate, fromTime: Float64(index))
        }
        
        return (animatedGif(from: videoFrames), Int(duration))
    }
    
    func generateFrames(assetImgGenerate:AVAssetImageGenerator, fromTime:Float64)
    {
        let time:CMTime = CMTimeMakeWithSeconds(fromTime, 600)
        let cgImage:CGImage?
        
        do
        {
            cgImage = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let frameImg:UIImage = UIImage(cgImage:cgImage!)
            videoFrames.append(frameImg)
        }
        catch let error as NSError {
            
            print("Found error in saving entity changes \(error)")
        }
        
    }
    
    func animatedGif(from images: [UIImage]) -> URL{
        let fileProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: 0]]  as CFDictionary
        let frameProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [(kCGImagePropertyGIFDelayTime as String): 1.0]] as CFDictionary
        
        let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let filename = UUID().uuidString
        let fileURL: URL? = documentsDirectoryURL?.appendingPathComponent("\(filename).gif")
        
        if let url = fileURL as CFURL? {
            if let destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, images.count, nil) {
                CGImageDestinationSetProperties(destination, fileProperties)
                for image in images {
                    if let cgImage = image.cgImage {
                        CGImageDestinationAddImage(destination, cgImage, frameProperties)
                    }
                }
                if !CGImageDestinationFinalize(destination) {
                    print("Failed to finalize the image destination")
                }
                print("Url = \(fileURL)")
                return fileURL!
            }
        }
        return URL(string: "")!

    }
}
