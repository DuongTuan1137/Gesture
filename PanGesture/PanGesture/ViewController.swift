//
//  ViewController.swift
//  PanGesture
//
//  Created by AnhDCT on 8/20/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var s = 0
    private let basket = UIImageView(image: UIImage(named: "ro"))
    private let score = UILabel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLable()
        setupImg()
        setupEgg()
        
        // Do any additional setup after loading the view.
    }
    fileprivate func setupLable() {
        score.text = String(s)
        score.frame = CGRect(origin: .zero, size: CGSize(width: 50, height: 50))
        view.addSubview(score)
    }
    
    fileprivate func setupImg() {
        basket.isUserInteractionEnabled = true
        basket.frame = CGRect(x: 0, y: self.view.frame.height - 50, width: 50, height: 50)
        view.addSubview(basket)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(move))
        basket.addGestureRecognizer(pan)
    }
    
    fileprivate func setupEgg() {
        let number = 10
        let eggSize = view.frame.width / CGFloat(number)
        for i in 0..<number{
            let egg = UIView()
            egg.frame = CGRect(x: eggSize * CGFloat(i), y: 50, width: eggSize, height: eggSize)
            egg.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
            egg.layer.cornerRadius = eggSize/2
            view.addSubview(egg)
            UIView.animate(withDuration: 5, delay: drand48() * 10, options: .repeat, animations: {
                egg.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            }, completion: nil)
        }
        
    }
    
    @objc func move(sender:UIPanGestureRecognizer){
        if sender.state == .changed{
            let tranlation = sender.translation(in: self.view)
            basket.center = CGPoint(x: basket.center.x + tranlation.x, y: basket.center.y)
            
                sender.setTranslation(CGPoint.zero, in: self.view)
        } else if sender.state == .ended{
            basket.center = CGPoint(x: self.view.center.x, y: self.view.frame.height - 25)
            }
    }
}

