//
//  ViewController.swift
//  SimpleCollectionView
//
//  Created by Anupam Chugh on 12/05/16.
//  Copyright © 2016 Journal Dev. All rights reserved.
//

import UIKit


let reuseIdentifier = "CustomCell";


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var userInfoArray = [UserInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.collectionView!.register(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let info1 = UserInfo()
        info1.profileImage = UIImage(named: "profilePic1")
        info1.userName = "Amogh"
        info1.images = ["pic1", "pic2", "pic3"]
        userInfoArray.append(info1)
        
        let info2 = UserInfo()
        info2.profileImage = UIImage(named: "profilePic2")
        info2.userName = "Amogh"
        info2.images = ["pic1", "pic2"]
        userInfoArray.append(info2)
        
        collectionView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 10;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 73.0, height: 93.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(14.0, 14.0, 0.0, 14.0)
    }
    
    //UICollectionViewDatasource methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if ((userInfoArray.count) > 0){
            return (userInfoArray.count)
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        let info = userInfoArray[indexPath.row]
        cell.info = info
        cell.setupCell()
        //cell.backgroundColor = self.randomColor()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = StoryViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    // custom function to generate a random UIColor
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
}

