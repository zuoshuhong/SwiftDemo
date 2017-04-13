//
//  CommonView.swift
//  ZMenuDropView
//
//  Created by admin on 2017/3/31.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class CommonView: UIView {

}

class SegmentView: UIView {
    
    var titlesGroup: [String] = []
    
    fileprivate var imagesGroup: [UIImage] = []
    fileprivate var baseFont: UIFont = UIFont()
    fileprivate var baseColor: UIColor = UIColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let imageWidth = 8
        let baseWidth = rect.size.width / CGFloat(titlesGroup.count)
        let buttonWidth = (baseWidth - 1 - 8)
        
        for i in 0...(titlesGroup.count - 1) {
            let button: UIButton = UIButton(type: .custom)
            button.frame = CGRect(x: CGFloat(baseWidth) * CGFloat(i), y: 0, width: buttonWidth, height: rect.size.height)
            button.setTitle(titlesGroup[i], for: .normal)
            button.setTitleColor(UIColor.red, for: .normal)
            button.tag = i
            button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            button.backgroundColor = UIColor.yellow
            button.addTarget(self, action: #selector(buttonHandle(sender:)), for: .touchUpInside)
            addSubview(button)
            
            let imageView: UIImageView = UIImageView(frame: CGRect(x: Int(buttonWidth + CGFloat(baseWidth) * CGFloat(i)), y: 0, width: imageWidth, height: imageWidth))
            imageView.backgroundColor = UIColor.gray
            addSubview(imageView)
        }
        
    }
    
    @objc fileprivate func buttonHandle(sender: UIButton) {
        print(sender.tag)
    }
}

class BaseView: UIView {
    var titlesGroup: [String] = []
    
    fileprivate var baseFont: UIFont = UIFont()
    fileprivate var baseColor: UIColor = UIColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        
        let baseWidth = rect.size.width / CGFloat(titlesGroup.count)
        let buttonWidth = (baseWidth - 1)
        
        for i in 0...(titlesGroup.count - 1) {
            let button: UIButton = UIButton(type: .custom)
            button.frame = CGRect(x: CGFloat(baseWidth) * CGFloat(i), y: 0, width: buttonWidth, height: rect.size.height)
            button.setTitle(titlesGroup[i], for: .normal)
            button.setTitleColor(UIColor.red, for: .normal)
            button.tag = i
            button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            button.backgroundColor = UIColor.white
            addSubview(button)
        }
        
        let buttonView: UIView = UIView(frame: CGRect(x: CGFloat(baseWidth) * CGFloat(titlesGroup.count - 1), y: 0, width: baseWidth, height: rect.size.height))
        buttonView.backgroundColor = UIColor.blue
        addSubview(buttonView)
        
        let button: UIButton = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: baseWidth, height: rect.size.height)
        button.backgroundColor = UIColor.white
        button.setTitle("所讲课程", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(UIColor.blue, for: .normal)
        
        button.setImage(UIImage(named: "up"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(CGFloat(rect.size.height - 8) / CGFloat(2), baseWidth - 30, CGFloat(rect.size.height - 8) / CGFloat(2), 10)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30)
        button.tag = 2
        button.addTarget(self, action: #selector(buttonHandle(sender:)), for: .touchUpInside)
        buttonView.addSubview(button)
        
    }
    
    @objc fileprivate func buttonHandle(sender: UIButton) {
        print(sender.tag)
    }
}




