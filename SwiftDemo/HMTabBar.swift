//
//  HMTabBar.swift
//  SwiftDemo
//
//  Created by 高 on 16/7/19.
//  Copyright © 2016年 高. All rights reserved.
//

import UIKit

class HMTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    private func setupUI() {
      addSubview(publishButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index = 0
        let width = bounds.width / 5
        for subview in subviews {
            if subview.isKindOfClass(NSClassFromString("UITabBarButton")!) {
             subview.frame = CGRectMake(width * CGFloat(index++), bounds.origin.x, width, bounds.size.height)
                
                if index == 2 { index++ }
            }
        }
        publishButton.frame = CGRectMake(width*2, bounds.origin.y, width, bounds.size.height)
    }
    
    lazy var publishButton: UIButton = {
        let button = UIButton(type:UIButtonType.Custom)

        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState:UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState:UIControlState.Highlighted)
        button.sizeToFit()
        
        return button
    }()
    
}
