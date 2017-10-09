//
//  StoryViewController.swift
//  StoryFlip
//
//  Created by Mac Mini on 07/10/17.
//  Copyright © 2017 Borqs. All rights reserved.
//

import UIKit
import MobileCoreServices

class StoryViewController: UIViewController {
//    NSURL *sourceMovieURL = [NSURL fileURLWithPath:somePath];
//    AVURLAsset *sourceAsset = [AVURLAsset URLAssetWithURL:sourceMovieURL options:nil];
//    CMTime duration = sourceAsset.duration;
    var progressV: UIView?
    var timer: Timer?
    var time: Float?
    var progressBar : UIProgressView?
    var progressBar1 : UIProgressView?
    var selectedIndex = 0
    var storiesCount: Int!
    var barArray = [UIProgressView]()
    var imgView: UIImageView!
    public var userInfo: UserInfo?
    var currentMedia: Media?
    
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        imgView = UIImageView()
        imgView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(imgView)
        storiesCount = userInfo?.images?.count
        startStories(numberOfStories: storiesCount)
    }
    
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        timer?.invalidate()
        if (selectedIndex > storiesCount - 1) {
            //TODO
            print("TODO")
            self.dismiss(animated: true, completion: nil)
        }
        else {
            redraw(index: selectedIndex - 1)
            self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector:#selector(StoryViewController.setProgres), userInfo: nil, repeats: true)
            setProgres()
        }
    }
    
    
    func redraw(index: Int) {
        let bar = barArray[index]
        bar.removeFromSuperview()
        let progressView = UIProgressView()
        progressView.progress = 1.0
        progressView.frame = bar.frame
        progressView.progressTintColor = UIColor.red
        progressView.trackTintColor = UIColor.white
        progressV?.addSubview(progressView)
    }
    func clicked(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func startStories(numberOfStories: Int) {
        var count = 0
        progressV = UIView(frame: CGRect(x: 10.0, y: 0.0, width: self.view.frame.size.width - 20, height: 15.0))
        let button = UIButton(frame: CGRect(x: self.view.frame.size.width - 50, y: 20.0, width: 40.0, height: 40.0))
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        button.setImage(UIImage(named:"x_mark"), for:.normal)
        self.view.addSubview(button)
        self.view.addSubview(progressV!)
        var width = progressV!.frame.size.width - CGFloat(10 * (numberOfStories - 1))
        width = width/CGFloat(numberOfStories)
        var lastFrame: CGRect = CGRect(x: progressV!.frame.origin.x, y: progressV!.frame.origin.y, width: width, height: 0.0)
        while count < numberOfStories {
            let progressView = UIProgressView()
            progressView.progress = 0.0
            var frame = progressView.frame
            frame.size.width = width
            if (lastFrame.origin.x > 10.0) {
                frame.origin.x = lastFrame.origin.x + frame.size.width
            }
            else {
                frame.origin.x = 0.0
            }
            progressView.progressTintColor = UIColor.red
            progressView.trackTintColor = UIColor.white
            progressView.frame = frame
            progressView.tag = count
            lastFrame = frame
            if (count != numberOfStories - 1) {
                lastFrame.origin.x += 11.0
            }
            progressV!.addSubview(progressView)
            barArray.append(progressView)
            count += 1
        }
        //currentMedia = userInfo?.images?[selectedIndex]
        //setTimer()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector:#selector(StoryViewController.setProgres), userInfo: nil, repeats: true)
        setProgres()
    }
    
    func setTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(currentMedia!.duration!), target: self, selector:#selector(StoryViewController.setProgres), userInfo: nil, repeats: true)
    }
    
    func redrawAgain(index: Int) {
        timer?.invalidate()
        let bar = barArray[index]
        bar.removeFromSuperview()
        let progressView = UIProgressView()
        progressView.progress = 0.0
        progressView.frame = bar.frame
        progressView.progressTintColor = UIColor.red
        progressView.trackTintColor = UIColor.white
        progressV?.addSubview(progressView)
        barArray[index] = progressView
    }
    
    func setProgres() {
        if (selectedIndex > storiesCount - 1) {
            timer?.invalidate()
            self.dismiss(animated: true, completion: nil)
        }
        else {
//            self.setTimer()
            let bar = barArray[selectedIndex]
            self.currentMedia = self.userInfo?.images![self.selectedIndex]
            change(progressBar: bar)
            print("\(selectedIndex) url: \(currentMedia!.imageURL!.absoluteString)")
            imgView.setImageFromURl(stringImageUrl: (currentMedia!.imageURL!.absoluteString))
            selectedIndex += 1
        }
    }
    
    
    func change(progressBar: UIProgressView){
        progressBar.setProgress(0.01, animated: true)
        
        UIView.animate(withDuration: 5, delay: 0.0, options: [.curveLinear, .allowUserInteraction, .beginFromCurrentState], animations: {
            progressBar.setProgress(1.0, animated: true)
        }, completion: { (result) in
            print("Completion")
        })
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension UIProgressView {
    
    func animate(duration: Double) {
        
        
    }


}
