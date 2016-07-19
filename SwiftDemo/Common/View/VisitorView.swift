//
//  VisitorView.swift
//  SwiftDemo
//
//  Created by 高 on 16/7/19.
//  Copyright © 2016年 高. All rights reserved.
//

import UIKit

let VisitorViewMargin: CGFloat = 10

protocol VisitorDelegate :NSObjectProtocol {
    func didLoginMethod()
    func didRegisterMethod()
}

class VisitorView: UIView {

    weak var delegate:VisitorDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        backgroundColor = UIColor(white: 237/255.0, alpha: 1.0)
        
        addSubview(iconImageView)
        addSubview(maskImageView)
        addSubview(homeIconView)
        addSubview(noticeLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
//        iconImageView.sn
        
        
    }
    
    func startAnimation(){
       let animation = CABasicAnimation(keyPath: "transfrom.rotation")
        animation.duration = 10
        animation.toValue = 2*M_2_PI
        animation.repeatCount = MAXFLOAT
        animation.removedOnCompletion = false
//        icomImageView/
        
    }
    
    private lazy var maskImageView:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        return img
    }()
    
    private lazy var iconImageView:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "visitordiscover_feed_image_smallicon")
        return img
    }()
    
    private lazy var homeIconView:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "visitordiscover_feed_image_house")
        return img
    }()
    
    private lazy var noticeLabel:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFontOfSize(14)
        lb.textColor = UIColor.darkGrayColor()
        lb.text = "关注一些人，回这里看看有什么惊喜"
        lb.textAlignment = NSTextAlignment.Center
        lb.numberOfLines = 0
        lb.sizeToFit()
        return lb
    }()
    
    ///登陆按钮
    private lazy var loginButton: UIButton = {
        
        let bt = UIButton(type: UIButtonType.Custom)
        
        bt.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        bt.setTitle("登陆", forState: UIControlState.Normal)
        bt.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        
        bt.addTarget(self , action: "loginMethod", forControlEvents: UIControlEvents.TouchUpInside)
        
        return bt
    }()
    
    ///注册按钮
    private lazy var registerButton: UIButton = {
        
        let bt = UIButton(type: UIButtonType.Custom)
        
        
        bt.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        bt.setTitle("注册", forState: UIControlState.Normal)
        bt.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        
        bt.addTarget(self, action: "registerMethod", forControlEvents: UIControlEvents.TouchUpInside)
        
        return bt
    }()
}
