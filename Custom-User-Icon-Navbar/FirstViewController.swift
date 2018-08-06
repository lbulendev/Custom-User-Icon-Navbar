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
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {        
        let userPhoto = UserIconView()
        userPhoto.frame = CGRect(x:10.0, y:20.0, width:64.0, height:44.0);
        let tap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.userProfileButton))
        tap.delegate = self
        userPhoto.addGestureRecognizer(tap)

        self.navigationController?.view.addSubview(userPhoto)
    }
    
    @objc func userProfileButton(sender : UIButton) {
        print("test button")
    }
}
