//
//  CommonView.swift
//  ZPickerView
//
//  Created by admin on 2017/4/11.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

/// 底部弹出框 PickerView
protocol ZPickerViewDelegate {
    func getItem(item: String, index: Int)
}

class ZPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate: ZPickerViewDelegate?
    
    fileprivate var btnView: UIView = UIView()
    fileprivate var bgView: UIView = UIView()
    fileprivate var pickerView: UIPickerView = UIPickerView()
    fileprivate var models: [String] = []
    fileprivate var selectItem: String = ""
    fileprivate var selectIndex: Int = -1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showViewController(vc: UIViewController) {
        bgView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        bgView.backgroundColor = UIColor.clear
        bgView.alpha = 0.5
        vc.view.addSubview(bgView)
        vc.view.addSubview(self)
    }
    
    func setData(titleString: String, titles:[String]) {
        
        models = titles
        
        btnView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 30))
        btnView.backgroundColor = UIColor.white
        addSubview(btnView)
        
        let topLine = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1))
        topLine.backgroundColor = UIColor.red
        btnView.addSubview(topLine)
        
        let bottomLine = UIView(frame: CGRect(x: 0, y: btnView.frame.size.height - 1, width: self.frame.size.width, height: 1))
        bottomLine.backgroundColor = UIColor.red
        btnView.addSubview(bottomLine)
        
        let cancleBtn = UIButton(type: .custom)
        cancleBtn.frame = CGRect(x: 15, y: (btnView.frame.size.height - 15) / CGFloat(2), width: 30, height: 15)
        cancleBtn.setImage(UIImage(named: "cancle"), for: .normal)
        cancleBtn.addTarget(self, action: #selector(cancleBtnHandle(sende:)), for: .touchUpInside)
        btnView.addSubview(cancleBtn)
        
        let sureBtn = UIButton(type: .custom)
        sureBtn.frame = CGRect(x: self.frame.size.width - 15 - 30, y: (btnView.frame.size.height - 15) / CGFloat(2), width: 30, height: 15)
        sureBtn.setImage(UIImage(named: "submit"), for: .normal)
        sureBtn.addTarget(self, action: #selector(sureBtnHandle(sende:)), for: .touchUpInside)
        btnView.addSubview(sureBtn)
        
        let centerLab = UILabel(frame: CGRect(x: (self.frame.size.width - 150) / CGFloat(2), y: 0, width: 150, height: btnView.frame.size.height))
        centerLab.text = titleString
        centerLab.textAlignment = .center
        centerLab.font = UIFont.systemFont(ofSize: 12)
        centerLab.textColor = UIColor.red
        btnView.addSubview(centerLab)
        
        pickerView = UIPickerView(frame: CGRect(x: 0, y: btnView.frame.size.height, width: self.frame.size.width, height: self.frame.size.height - btnView.frame.size.height))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.white
        addSubview(pickerView)
    }
    
    func sureBtnHandle(sende: UIButton) {
        hidenViews()
        
        if selectIndex == -1 {
            delegate?.getItem(item: models[0], index: 0)
        } else {
            delegate?.getItem(item: selectItem, index: selectIndex)
        }
    }
    
    func cancleBtnHandle(sende: UIButton) {
        hidenViews()
    }
    
    func hidenViews() {
        self.removeFromSuperview()
        bgView.removeFromSuperview()
    }
}

// UIPickerViewDataSource
extension ZPickerView {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return models.count
    }
}

// UIPickerViewDelegate
extension ZPickerView {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return models[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 25
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return self.frame.size.width
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let lab: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 25))
        lab.textAlignment = .center
        lab.text = models[row]
        lab.textColor = UIFont.systemFont(ofSize: 12)
        lab.font = UIFont.systemFont(ofSize: 14)
        
        for (index, view) in pickerView.subviews.enumerated() {
            if index == 1 {
                view.backgroundColor = UIColor.red
            }
            
            if index == 2 {
                view.backgroundColor = UIColor.red
            }
        }
        
        return lab
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectItem = models[row]
        selectIndex = row
    }
}

