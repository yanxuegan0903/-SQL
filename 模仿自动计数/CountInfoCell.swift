//
//  CountInfoCell.swift
//  模仿自动计数
//
//  Created by vsKing on 2016/12/24.
//  Copyright © 2016年 vsKing. All rights reserved.
//

import Foundation








class CountInfoCell: UITableViewCell {
    
    let numberLabel:UILabel = UILabel.init()
    let countLabel:UILabel = UILabel.init()
    let timeLabel:UILabel = UILabel.init()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initUI()
        
    }
    
    func initUI() {
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        
        self.contentView.addSubview(numberLabel)
        numberLabel.text = "编号"
        numberLabel.textColor = UIColor.black
        numberLabel.textAlignment = NSTextAlignment.left
        numberLabel.font = UIFont.systemFont(ofSize: 12)
        numberLabel.sizeToFit()
        numberLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(NSNumber.getTransNumberCompareWidth(30*Screen_Mul))
            make.right.equalTo(self.contentView.snp.centerX).offset(-NSNumber.getTransNumberCompareWidth(30*Screen_Mul))
            make.top.equalTo(self.contentView.snp.top).offset(NSNumber.getTransNumberCompareHeight(5*Screen_Mul))
            make.height.equalTo(NSNumber.getTransNumberCompareHeight(30*Screen_Mul))
        }
        
        
        
        self.contentView.addSubview(countLabel)
        countLabel.text = "次数"
        countLabel.textColor = numberLabel.textColor
        countLabel.textAlignment = NSTextAlignment.left
        countLabel.font = numberLabel.font
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
        timeLabel.font = numberLabel.font
        timeLabel.sizeToFit()
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(numberLabel.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.height.equalTo(numberLabel.snp.height)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-NSNumber.getTransNumberCompareHeight(5*Screen_Mul))
        }
        
        
                
    }
    
    
    func configInfo(countInfo:CountInfo) {
        
        numberLabel.text = "编号  \(countInfo.id)"
        countLabel.text = "次数  \(countInfo.count)"
        
//        let timeF = countInfo.timeFrom as NSString
//        let timeT = countInfo.timeTo as NSString
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let dateF = dateFormatter.date(from: countInfo.timeFrom)
        let dateT = dateFormatter.date(from: countInfo.timeTo)
        let timeInterval = dateT?.timeIntervalSince(dateF!)
        
        
        let hour:Int = Int.init(timeInterval!/(60*60))
        let min:Int = Int.init( (timeInterval! - Double.init(hour)*60*60) / 60 )
        let sec:Int = Int.init((timeInterval! - Double.init(hour)*60*60 - Double.init(min)*60))
        timeLabel.text = "用时  \(hour) : \(min) : \(sec)"
        
        
//        timeLabel.text = "时间  \(timeF.substring(with: NSMakeRange(0, 4)))/\(timeF.substring(with: NSMakeRange(4, 2)))/\(timeF.substring(with: NSMakeRange(6, 2))) \(timeF.substring(with: NSMakeRange(8, 2))):\(timeF.substring(with: NSMakeRange(10, 2))):\(timeF.substring(with: NSMakeRange(12, 2))) ~ \(timeT.substring(with: NSMakeRange(0, 4)))/\(timeT.substring(with: NSMakeRange(4, 2)))/\(timeT.substring(with: NSMakeRange(6, 2))) \(timeT.substring(with: NSMakeRange(8, 2))):\(timeT.substring(with: NSMakeRange(10, 2))):\(timeT.substring(with: NSMakeRange(12, 2)))"
        
        
        

    }
    
    
    
    
    
    
    
    
    
}
