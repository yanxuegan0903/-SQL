//
//  CountInfoCell.swift
//  模仿自动计数
//
//  Created by vsKing on 2016/12/24.
//  Copyright © 2016年 vsKing. All rights reserved.
//

import Foundation

let numberLabel:UILabel = UILabel.init()
let countLabel:UILabel = UILabel.init()
let timeLabel:UILabel = UILabel.init()







class CountInfoCell: UITableViewCell {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
        
    }
    
    func initUI() {
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        
        self.contentView.addSubview(numberLabel)
        numberLabel.text = "编号"
        numberLabel.textColor = UIColor.black
        numberLabel.textAlignment = NSTextAlignment.left
        numberLabel.sizeToFit()
        numberLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(NSNumber.getTransNumberCompareWidth(30*Screen_Mul))
            make.right.equalTo(self.contentView.snp.centerX).offset(-NSNumber.getTransNumberCompareWidth(30*Screen_Mul))
            make.top.equalTo(self.contentView.snp.top).offset(NSNumber.getTransNumberCompareHeight(5*Screen_Mul))
            make.height.equalTo(NSNumber.getTransNumberCompareHeight(55*Screen_Mul))
        }
        
        
        
        self.contentView.addSubview(countLabel)
        countLabel.text = "次数"
        countLabel.textColor = numberLabel.textColor
        countLabel.textAlignment = NSTextAlignment.left
        countLabel.sizeToFit()
        countLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.centerX).offset(NSNumber.getTransNumberCompareWidth(30*Screen_Mul))
            make.right.equalTo(self.contentView.snp.right).offset(-NSNumber.getTransNumberCompareWidth(30*Screen_Mul))
            make.top.equalTo(numberLabel.snp.top)
            make.height.equalTo(numberLabel.snp.height)
        }
        
        
        self.contentView.addSubview(timeLabel)
        timeLabel.text = "时间"
        timeLabel.textColor = numberLabel.textColor
        timeLabel.textAlignment = NSTextAlignment.left
        timeLabel.sizeToFit()
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(numberLabel.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.height.equalTo(numberLabel.snp.height)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-NSNumber.getTransNumberCompareHeight(5*Screen_Mul))
        }
        
        
                
    }
    
    
    func configInfo(countInfo:CountInfo) {
        
        numberLabel.text = String.init(format: "编号  %d", countInfo.id)
        countLabel.text = String.init(format: "次数  %d", countInfo.count)
        timeLabel.text = String.init(format: "时间  %@ ~ %@", countInfo.timeFrom,countInfo.timeTo)
        
    }
    
    
    
    
    
    
    
    
    
}
