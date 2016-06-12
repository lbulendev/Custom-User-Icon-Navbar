//
//  FirstViewController.swift
//  Custom-User-Icon-Navbar
//
//  Created by Larry Bulen on 6/11/16.
//  Copyright © 2016 Larry Bulen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIGestureRecognizerDelegate {
    
    init () {
        super.init(nibName: nil, bundle: nil)
//        self.view.backgroundColor = UIColor.orangeColor()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {        
        let userPhoto = UserIconView()
        userPhoto.frame = CGRectMake(10, 20, 64, 44);
        let tap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.userProfileButton(_:)))
        tap.delegate = self
        userPhoto.addGestureRecognizer(tap)

        self.navigationController?.view.addSubview(userPhoto)
    }
    
    func userProfileButton(let sender : UIButton) {
        print("test button")
    }
}
