//
//  ViewController.swift
//  模仿自动计数
//
//  Created by vsKing on 2016/12/23.
//  Copyright © 2016年 vsKing. All rights reserved.
//

import UIKit
import SnapKit


enum BtnTag : NSInteger {
    case Minus = 0
    case Add
    case Reset
    case TimesCount
    
}


class ViewController: UIViewController {

    /**********************************/
    
    var count:NSInteger = 0
    let countLabel:UILabel = UILabel.init()
    let addBtn:UIButton = UIButton.init()

    
    
    
    /**********************************/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
        
        
        
    }
    
    
    //  初始化UI
    func initUI() {
        
        self.view.backgroundColor = UIColor.init(hex: 0xfcfcfc)
        
        let topView:UIView = UIView.init()
        self.view.addSubview(topView)
        topView.backgroundColor = UIColor.init(hex: 0xd3e3fb)
        
        topView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(NSNumber.getTransNumberCompareHeight(450*Screen_Mul))
        }
        
        //  数量
        self.view.addSubview(countLabel)
        countLabel.backgroundColor = UIColor.init(hex: 0xb1b4ba)
        countLabel.textColor = UIColor.init(hex: 0x323232)
        countLabel.font = UIFont.init(name: "Times", size: 70)
        countLabel.text = String.init(format: "%d", count)
        countLabel.textAlignment = NSTextAlignment.center
        
        countLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(topView.snp.bottom).offset(NSNumber.getTransNumberCompareHeight(10*Screen_Mul))
            make.height.equalTo(NSNumber.getTransNumberCompareHeight(260*Screen_Mul))
        }
        
        
        //  减
        let minusBtn:UIButton = UIButton.init()
        self.view.addSubview(minusBtn)
        minusBtn.backgroundColor = UIColor.init(hex: 0xd1d1d1)
        minusBtn.setTitle("减一", for: UIControlState.normal)
        minusBtn.titleLabel?.font = UIFont.init(name: "Times", size: 16)
        minusBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        minusBtn.tag = BtnTag.Minus.rawValue
        minusBtn.addTarget(self, action: #selector(clickBtn(sender:)), for: UIControlEvents.touchUpInside)
        
        
        minusBtn.snp.makeConstraints { (make) in
            make.left.equalTo(NSNumber.getTransNumberCompareWidth(8*Screen_Mul))
            make.right.equalTo(self.view.snp.centerX).offset(-NSNumber.getTransNumberCompareWidth(8*Screen_Mul))
            make.top.equalTo(countLabel.snp.bottom).offset(NSNumber.getTransNumberCompareHeight(18*Screen_Mul))
            make.height.equalTo(NSNumber.getTransNumberCompareHeight(144*Screen_Mul))
        }
        
        //  加
        self.view.addSubview(addBtn)
        addBtn.backgroundColor = minusBtn.backgroundColor
        addBtn.setTitle("开始", for: UIControlState.normal)
        addBtn.setTitle("加一", for: UIControlState.selected)
        addBtn.titleLabel?.font = minusBtn.titleLabel?.font
        addBtn.setTitleColor(UIColor.init(hex: 0x28e2f9), for: UIControlState.normal)
        addBtn.setTitleColor(UIColor.black, for: UIControlState.selected)
        addBtn.tag = BtnTag.Add.rawValue
        addBtn.addTarget(self , action: #selector(clickBtn(sender:)), for: UIControlEvents.touchUpInside)
        
        addBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-NSNumber.getTransNumberCompareWidth(8*Screen_Mul))
            make.left.equalTo(self.view.snp.centerX).offset(NSNumber.getTransNumberCompareWidth(8*Screen_Mul))
            make.top.equalTo(minusBtn.snp.top)
            make.height.equalTo(minusBtn.snp.height)
        }
        
        
        //  重置
        let resetBtn:UIButton = UIButton.init()
        self.view.addSubview(resetBtn)
        resetBtn.backgroundColor = UIColor.init(hex: 0xd3d3d3)
        resetBtn.setTitle("重置", for: UIControlState.normal)
        resetBtn.titleLabel?.font = minusBtn.titleLabel?.font
        resetBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        resetBtn.tag = BtnTag.Reset.rawValue
        resetBtn.addTarget(self , action: #selector(clickBtn(sender:)), for: UIControlEvents.touchUpInside)
        
        resetBtn.snp.makeConstraints { (make) in
            make.left.equalTo(minusBtn.snp.left)
            make.right.equalTo(minusBtn.snp.right)
            make.top.equalTo(minusBtn.snp.bottom).offset(NSNumber.getTransNumberCompareHeight(18*Screen_Mul))
            make.height.equalTo(NSNumber.getTransNumberCompareHeight(75*Screen_Mul))
        }
        
        
        //  计次
        let timesCountBtn:UIButton = UIButton.init()
        self.view.addSubview(timesCountBtn)
        timesCountBtn.backgroundColor = resetBtn.backgroundColor
        timesCountBtn.setTitle("计次", for: UIControlState.normal)
        timesCountBtn.titleLabel?.font = minusBtn.titleLabel?.font
        timesCountBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        timesCountBtn.tag = BtnTag.TimesCount.rawValue
        timesCountBtn.addTarget(self , action: #selector(clickBtn(sender:)), for: UIControlEvents.touchUpInside)
        
        timesCountBtn.snp.makeConstraints { (make) in
            make.left.equalTo(addBtn.snp.left)
            make.right.equalTo(addBtn.snp.right)
            make.top.equalTo(resetBtn.snp.top)
            make.height.equalTo(resetBtn.snp.height)
        }
        
    }
    
    
    
    //  按钮点击事件
    func clickBtn(sender:UIButton) {
        
        switch sender.tag {
            case BtnTag.Minus.rawValue :
                print("点击 减一 " + String.init(format: "tag = %d", sender.tag))
                count -= 1
                
                
            break
            case BtnTag.Add.rawValue :
                print("点击 加一 " + String.init(format: "tag = %d", sender.tag))
                
                if sender.isSelected {
                    count += 1
                }else {
                    sender.isSelected = true
                }
                
                
                
            break
            case BtnTag.Reset.rawValue :
                print("点击 重置 " + String.init(format: "tag = %d", sender.tag))
                
                count = 0
                
                
            break
            case BtnTag.TimesCount.rawValue :
                print("点击 计次 " + String.init(format: "tag = %d", sender.tag))
                addBtn.isSelected = false
                count = 0
                
            break
            
            default :
                print(" 错误 " + String.init(format: "tag = %d", sender.tag))
            break
        }
        
        
        countLabel.text = String.init(format: "%d", count)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

