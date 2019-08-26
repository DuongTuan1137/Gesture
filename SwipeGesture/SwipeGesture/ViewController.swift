//
//  ViewController.swift
//  SwipeGesture
//
//  Created by AnhDCT on 8/20/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    let arrImg = ["ho","ran","img1","img2","img3"]
    var i = 0
    var imgView = UIImageView(image: UIImage(named:"ho"))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imgView)
        imgView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
//
        let leftGesture = UISwipeGestureRecognizer(target: self , action: #selector(left) )
        leftGesture.direction = .left
        view.addGestureRecognizer(leftGesture)
        
        let rightGesture = UISwipeGestureRecognizer(target: self , action: #selector(right) )
        rightGesture.direction = .right
        view.addGestureRecognizer(rightGesture)
        
        
    }
  
    
    
    @objc func left(){
        
        if i == 0 {i = arrImg.count}
        i -= 1
        imgView.image = UIImage(named: arrImg[i])
        
    }
    @objc func right(){
        if i == arrImg.count - 1 {i = -1}
        i += 1
        imgView.image = UIImage(named: arrImg[i])
        
    }
    


}

