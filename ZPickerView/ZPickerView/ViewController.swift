//
//  ViewController.swift
//  ZPickerView
//
//  Created by admin on 2017/4/11.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZPickerViewDelegate {

    fileprivate var pickView: ZPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 20, width: 50, height: 60)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(buttonHandle(sender:)), for: .touchUpInside)
        view.addSubview(btn)
        
    }
    
    func buttonHandle(sender: UIButton) {
        pickView = ZPickerView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 300, width: UIScreen.main.bounds.width, height: 300))
        pickView.delegate = self
        pickView.setData(titleString: "发票类型", titles: ["item1", "item2", "item3"])
        pickView.showViewController(vc: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getItem(item: String, index: Int) {
        print(item)
        print(index)
    }

}

