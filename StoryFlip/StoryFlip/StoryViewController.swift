//
//  StoryViewController.swift
//  StoryFlip
//
//  Created by Mac Mini on 07/10/17.
//  Copyright © 2017 Borqs. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var progressV: UIView?
    var timer: Timer?
    var time: Float?
    var progressBar : UIProgressView?
    var progressBar1 : UIProgressView?
    var selectedIndex = 0
    var storiesCount: Int!
    var barArray = [UIProgressView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        startStories(numberOfStories: 3)
    }
    
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        timer?.invalidate()
        if (selectedIndex > storiesCount - 1) {
            //TODO
            print("TODO")
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
    
    
    func startStories(numberOfStories: Int) {
        var count = 0
        storiesCount = numberOfStories
        progressV = UIView(frame: CGRect(x: 10.0, y: 0.0, width: self.view.frame.size.width - 20, height: 15.0))
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
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector:#selector(StoryViewController.setProgres), userInfo: nil, repeats: true)
        setProgres()
    }
    
    func setProgres() {
        let bar = barArray[selectedIndex]
        change(progressBar: bar)
        imageView.image = UIImage(named: "pic\(selectedIndex + 1)")
        selectedIndex += 1
        if (selectedIndex > storiesCount - 1) {
            timer?.invalidate()
        }
    }
    
    func change(progressBar: UIProgressView){
        
        progressBar.setProgress(0.01, animated: true)
        
        UIView.animate(withDuration: 5, delay: 0.0, options: [.curveLinear, .allowUserInteraction, .beginFromCurrentState], animations: {
            progressBar.setProgress(1.0, animated: true)
        }, completion: nil)
    }
    
    func change1(progressBar: UIProgressView){
        
        UIView.animate(withDuration: 5.0, animations: {
            progressBar.setProgress(1.0, animated: true)
        }) { (result) in
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }


}
