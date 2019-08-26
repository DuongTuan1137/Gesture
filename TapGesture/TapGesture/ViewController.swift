//
//  ViewController.swift
//  TapGesture
//
//  Created by AnhDCT on 8/20/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(animation))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    @objc func animation(tap:UITapGestureRecognizer){
        let location = tap.location(in: view)
        let v = UIImageView()
        v.image = UIImage(named: "h20")
        v.backgroundColor = .yellow
        v.frame = CGRect(origin: location, size: CGSize(width: 25, height: 50))
        view.addSubview(v)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            v.frame = CGRect(x: location.x, y: self.view.frame.height, width: 25, height: 50)
        }, completion: nil)
    }
    


}

