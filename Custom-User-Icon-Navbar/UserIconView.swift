//
//  UserIconView.swift
//  Custom-User-Icon-Navbar
//
//  Created by Larry Bulen on 6/11/16.
//  Copyright © 2016 Larry Bulen. All rights reserved.
//

import UIKit

let userDict : NSDictionary = ["userLevel" : "1", "userScore" : "23", "minLevelScore" : "10", "nextLevelScore" : "60",
                               "userPhoto" : "userphoto.png"]

    class UserIconView: UIView {
    var userBkgdView : UIImageView
    var userPhotoView : UIImageView
    var userIcon : UIImage
    var userLevelLabel : UILabel
    var userLevelView : UIImageView

    init () {
        self.userBkgdView = UIImageView()
        self.userPhotoView = UIImageView()
        self.userIcon = UIImage()
        self.userLevelLabel = UILabel()
        self.userLevelView = UIImageView()
        super.init(frame: CGRect(x: 0.0, y: 20.0, width: 64.0, height: 44.0))

        let profileCompleteColor = UIColor.init(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        let profileBackGroundColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        let userProfileDictionary : NSDictionary = userDict
        let userLevelString : NSString = userProfileDictionary.object(forKey: "userLevel") as! NSString
        let userScoreFloat : Float =  (userProfileDictionary.object(forKey: "userScore")! as AnyObject).floatValue
        let minLevelScoreFloat : Float = (userProfileDictionary.object(forKey: "minLevelScore")! as AnyObject).floatValue
        let nextLevelScoreFloat : Float = (userProfileDictionary.object(forKey: "nextLevelScore")! as AnyObject).floatValue
        let numberOfLevels : Float = 6
        
        let intPercentComplete : Int = Int((userScoreFloat - minLevelScoreFloat) / (nextLevelScoreFloat - minLevelScoreFloat) * numberOfLevels) + 1
        self.userBkgdView = UIImageView.init(frame: CGRect(x:0.0, y:0.0, width:44.0, height:44.0))
        self.userBkgdView.backgroundColor = profileBackGroundColor
        self.userBkgdView.layer.cornerRadius = 44.0/2.0
        self.userBkgdView.layer.borderWidth = 2
        self.userBkgdView.layer.borderColor = profileBackGroundColor.cgColor
        self.userBkgdView.layer.masksToBounds = true
        self.userBkgdView.center = CGPoint(x:userBkgdView.frame.size.height/2, y:userBkgdView.frame.size.height/2)
        self.userBkgdView.image = self.pickImage(userLevel: intPercentComplete)
        self.backgroundColor = UIColor.clear
        self.addSubview(self.userBkgdView)
        
        
        self.userPhotoView = UIImageView.init(frame: CGRect(x:5.0, y:5.0, width:34.0, height:34.0))
        
        self.userIcon = UIImage()
        self.userLevelLabel = UILabel.init(frame: CGRect(x:0.0, y:0.0, width:50.0, height:50.0))
        self.userLevelView = UIImageView.init(frame: CGRect(x:44.0, y:0.0, width:20.0, height:20.0))
        self.userPhotoView = UIImageView.init(frame: CGRect(x:5.0, y:5.0, width:34.0, height:34.0))
        
        if (((userProfileDictionary.object(forKey:"userPhoto")) as AnyObject).lowercased.range(of:"Document") == nil) {
            // Get User Profile Icon from App bundle
//            self.userIcon = UIImage.init(imageLiteral: userProfileDictionary.objectForKey("userPhoto") as! String)
            self.userIcon = UIImage.init(imageLiteralResourceName: "userPhoto")
            self.userPhotoView.backgroundColor = UIColor.white
        } else {
//            let paths : NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//            let documentDirectory : NSString = paths.objectAtIndex(0) as! NSString
//            let imagePath = documentDirectory.stringByAppendingPathComponent("userProfile.png")
//            self.userIcon = UIImage.init(imageLiteral: "userPhoto")
        }
        self.userPhotoView.image = userIcon
        self.userPhotoView.layer.cornerRadius = 34.0/2.0
        self.userPhotoView.layer.borderWidth = 3
        self.userPhotoView.layer.borderColor = profileBackGroundColor.cgColor
        self.userPhotoView.layer.masksToBounds = true
        self.addSubview(self.userPhotoView)
        
        self.userLevelLabel = UILabel.init(frame: CGRect(x:0.0, y:0.0, width:50.0, height:50.0))
        self.userLevelLabel.textColor = profileCompleteColor
        self.userLevelLabel.backgroundColor = UIColor.clear
        self.userLevelLabel.text = userLevelString as String
        self.userLevelLabel.font = UIFont.boldSystemFont(ofSize: 12)
        self.userLevelLabel.center = CGPoint(x:35-(self.userLevelLabel.intrinsicContentSize.width/2), y:10)
        
        self.userLevelView = UIImageView.init(frame: CGRect(x:44.0, y:0.0, width:20.0, height:20.0))
        self.userLevelView.backgroundColor = profileBackGroundColor
        self.userLevelView.layer.cornerRadius = 20.0/2.0
        self.userLevelView.layer.borderWidth = 4
        self.userLevelView.layer.borderColor = profileBackGroundColor.cgColor
        self.userLevelView.layer.masksToBounds = true
        self.userLevelView.addSubview(self.userLevelLabel)
        self.addSubview(self.userLevelView)        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    

    func pickImage(userLevel : Int) -> UIImage {
        var returnImage = UIImage()
        switch (userLevel) {
            case 0:
                returnImage = UIImage.init(imageLiteralResourceName: "star6-0")
            case 1:
                returnImage = UIImage.init(imageLiteralResourceName: "star6-1")
            case 2:
                returnImage = UIImage.init(imageLiteralResourceName: "star6-2")
            case 3:
                returnImage = UIImage.init(imageLiteralResourceName: "star6-3")
            case 4:
                returnImage = UIImage.init(imageLiteralResourceName: "star6-4")
            case 5:
                returnImage = UIImage.init(imageLiteralResourceName: "star6-5")
            default:
                returnImage = UIImage.init(imageLiteralResourceName: "star6-6")
        }
        return returnImage;
    }

}
