//
//  UserModel.swift
//  SwiftDemo
//
//  Created by 高 on 16/7/18.
//  Copyright © 2016年 高. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    
    var accessToken: String?
    
    var expires_date:NSDate?
    
    var expries_in:NSTimeInterval = 0 {
        didSet{
            expires_date = NSDate(timeIntervalSinceNow:expries_in)
        }
    }
    
    var usercode:String?
    var username:String?
    var avatar:String?
    
    init(dic:[String:AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    func encodeWithCoder(aCoder:NSCoder) {
        aCoder.encodeObject(accessToken, forKey: "access_token")
        aCoder.encodeObject(expries_in, forKey: "expires_in")
        aCoder.encodeObject(usercode, forKey: "uid")
        aCoder.encodeObject(username, forKey: "name")
        aCoder.encodeObject(avatar, forKey: "avatar_large")
        
        //保存日期
        aCoder.encodeObject(expires_date, forKey: "expires_date")
    }
    
    required init?(coder aDecoder: NSCoder) {
        accessToken = aDecoder.decodeObjectForKey("access_token") as? String
        expries_in = aDecoder.decodeObjectForKey("expires_in") as! NSTimeInterval
        usercode = aDecoder.decodeObjectForKey("uid") as? String
        username = aDecoder.decodeObjectForKey("name") as? String
        avatar = aDecoder.decodeObjectForKey("avatar_large") as? String
        
        //读取日期
        expires_date = aDecoder.decodeObjectForKey("expires_date") as? NSDate
    }
    
    static var CurrentUser:UserModel?
    
    let path = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("user.archive")
    
    class func loadCurrentUser() ->UserModel? {
        
        if let currUser = CurrentUser {
          return currUser
        }
        
//        CurrentUser = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? UserModel
        
        if let date = CurrentUser?.expires_date where date.compare(NSDate()) != NSComparisonResult.OrderedAscending{
         return CurrentUser
        }
        
        CurrentUser = nil
        
        return nil
    }
    
}
