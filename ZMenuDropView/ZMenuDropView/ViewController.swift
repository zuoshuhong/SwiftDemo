//
//  ViewController.swift
//  ZMenuDropView
//
//  Created by admin on 2017/3/31.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let segView: BaseView = BaseView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 20))
        segView.titlesGroup = ["收益人数 222", "满意度 100%", "所讲课程"]
        view.addSubview(segView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

