//
//  TabbarController.swift
//  SwiftDemo
//
//  Created by 高 on 16/7/18.
//  Copyright © 2016年 高. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildViewController(HomeViewController() ,title:"首页" ,image:"tabbar_home")
        addChildViewController(MessageViewController() ,title:"消息" ,image:"tabbar_message_center")
        addChildViewController(DiscoverViewController() ,title:"发现" ,image:"tabbar_discover")
        addChildViewController(PersonViewController() ,title:"设置" ,image:"tabbar_profile")
        
        UITabBar.appearance().tintColor = UIColor .orangeColor()
        
        let tabbar = HMTabBar()
        
        setValue(tabbar, forKey: "tabBar")
        
        tabbar.publishButton.addTarget(self, action: "showPublish", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func showPublish(){
       let pubLish = PublishViewController()
        let nav = UINavigationController(rootViewController: pubLish)
        presentViewController(nav, animated: true) { () -> Void in
            
        }
        
    }
    
    private func addChildViewController(childController: UIViewController , title:String ,image :String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: image)
        childController.tabBarItem.selectedImage = UIImage (named: "\(image)_highlighted")
        
        let nav = UINavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
