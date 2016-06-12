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
        super.init(frame: CGRectMake(0, 20, 64, 44))

        let profileCompleteColor = UIColor.init(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        let profileBackGroundColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        let userProfileDictionary : NSDictionary = userDict
        let userLevelString : NSString = userProfileDictionary.objectForKey("userLevel") as! NSString
        let userScoreFloat : Float =  userProfileDictionary.objectForKey("userScore")!.floatValue
        let minLevelScoreFloat : Float = userProfileDictionary.objectForKey("minLevelScore")!.floatValue
        let nextLevelScoreFloat : Float = userProfileDictionary.objectForKey("nextLevelScore")!.floatValue
        let numberOfLevels : Float = 6
        
        let intPercentComplete : Int = Int((userScoreFloat - minLevelScoreFloat) / (nextLevelScoreFloat - minLevelScoreFloat) * numberOfLevels) + 1
        self.userBkgdView = UIImageView.init(frame: CGRectMake(0, 0, 44, 44))
        self.userBkgdView.backgroundColor = profileBackGroundColor
        self.userBkgdView.layer.cornerRadius = 44.0/2.0
        self.userBkgdView.layer.borderWidth = 2
        self.userBkgdView.layer.borderColor = profileBackGroundColor.CGColor
        self.userBkgdView.layer.masksToBounds = true
        self.userBkgdView.center = CGPointMake(userBkgdView.frame.size.height/2, userBkgdView.frame.size.height/2)
        self.userBkgdView.image = self.pickImage(intPercentComplete)
        self.backgroundColor = UIColor.clearColor()
        self.addSubview(self.userBkgdView)
        
        
        self.userPhotoView = UIImageView.init(frame: CGRectMake(5, 5, 34, 34))
        
        self.userIcon = UIImage()
        self.userLevelLabel = UILabel.init(frame: CGRectMake(0, 0, 50, 50))
        self.userLevelView = UIImageView.init(frame: CGRectMake(44, 0, 20, 20))
        self.userPhotoView = UIImageView.init(frame: CGRectMake(5, 5, 34, 34))
        
        if ((userProfileDictionary.objectForKey("userPhoto"))?.lowercaseString.rangeOfString("Document") == nil) {
            // Get User Profile Icon from App bundle
//            self.userIcon = UIImage.init(imageLiteral: userProfileDictionary.objectForKey("userPhoto") as! String)
            self.userIcon = UIImage.init(imageLiteral: "userPhoto")
            self.userPhotoView.backgroundColor = UIColor.whiteColor()
        } else {
//            let paths : NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//            let documentDirectory : NSString = paths.objectAtIndex(0) as! NSString
//            let imagePath = documentDirectory.stringByAppendingPathComponent("userProfile.png")
//            self.userIcon = UIImage.init(imageLiteral: "userPhoto")
        }
        self.userPhotoView.image = userIcon
        self.userPhotoView.layer.cornerRadius = 34.0/2.0
        self.userPhotoView.layer.borderWidth = 3
        self.userPhotoView.layer.borderColor = profileBackGroundColor.CGColor
        self.userPhotoView.layer.masksToBounds = true
        self.addSubview(self.userPhotoView)
        
        self.userLevelLabel = UILabel.init(frame: CGRectMake(0, 0, 50, 50))
        self.userLevelLabel.textColor = profileCompleteColor
        self.userLevelLabel.backgroundColor = UIColor.clearColor()
        self.userLevelLabel.text = userLevelString as String
        self.userLevelLabel.font = UIFont.boldSystemFontOfSize(12)
        self.userLevelLabel.center = CGPointMake(35-(self.userLevelLabel.intrinsicContentSize().width/2), 10)
        
        self.userLevelView = UIImageView.init(frame: CGRectMake(44, 0, 20, 20))
        self.userLevelView.backgroundColor = profileBackGroundColor
        self.userLevelView.layer.cornerRadius = 20.0/2.0
        self.userLevelView.layer.borderWidth = 4
        self.userLevelView.layer.borderColor = profileBackGroundColor.CGColor
        self.userLevelView.layer.masksToBounds = true
        self.userLevelView.addSubview(self.userLevelLabel)
        self.addSubview(self.userLevelView)        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    

    func pickImage(let userLevel : Int) -> UIImage {
        var returnImage = UIImage()
        switch (userLevel) {
            case 0:
                returnImage = UIImage.init(imageLiteral: "star6-0")
            case 1:
                returnImage = UIImage.init(imageLiteral: "star6-1")
            case 2:
                returnImage = UIImage.init(imageLiteral: "star6-2")
            case 3:
                returnImage = UIImage.init(imageLiteral: "star6-3")
            case 4:
                returnImage = UIImage.init(imageLiteral: "star6-4")
            case 5:
                returnImage = UIImage.init(imageLiteral: "star6-5")
            default:
                returnImage = UIImage.init(imageLiteral: "star6-6")
        }
        return returnImage;
    }

}
