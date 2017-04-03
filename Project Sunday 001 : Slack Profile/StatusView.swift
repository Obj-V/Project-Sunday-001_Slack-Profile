//
//  StatusView.swift
//  Project Sunday 001 : Slack Profile
//
//  Created by Virata Yindeeyoungyeon on 4/2/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

class StatusView: UIView {

    var nameLabel:UILabel!
    var usernameLabel:UILabel!
    private var delimeterLine:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        nameLabel = UILabel()
        nameLabel.backgroundColor = UIColor.clear
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        self.addSubview(nameLabel)
        
        usernameLabel = UILabel()
        usernameLabel.backgroundColor = UIColor.clear
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.textAlignment = NSTextAlignment.center
        usernameLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 15)
        self.addSubview(usernameLabel)
        
        delimeterLine = UIView()
        delimeterLine.backgroundColor = UIColor.lightGray
        delimeterLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(delimeterLine)
        
        setupContraints()
    }
    
    private func setupContraints() {
        let nameLabelWidth = NSLayoutConstraint.init(item: nameLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0)
        let nameLabelHeight = NSLayoutConstraint.init(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.5, constant: 0)
        let nameLabelCenterX = NSLayoutConstraint.init(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let nameLabelTop = NSLayoutConstraint.init(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        self.addConstraints([nameLabelWidth,nameLabelHeight,nameLabelCenterX,nameLabelTop])
        
        let usernameLabelWidth = NSLayoutConstraint.init(item: usernameLabel, attribute: .width, relatedBy: .equal, toItem: nameLabel, attribute: .width, multiplier: 1.0, constant: 0)
        let usernameLabelHeight = NSLayoutConstraint.init(item: usernameLabel, attribute: .height, relatedBy: .equal, toItem: nameLabel, attribute: .height, multiplier: 1.0, constant: 0)
        let usernameLabelCenterX = NSLayoutConstraint.init(item: usernameLabel, attribute: .centerX, relatedBy: .equal, toItem: nameLabel, attribute: .centerX, multiplier: 1.0, constant: 0)
        let usernameLabelTop = NSLayoutConstraint.init(item: usernameLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.addConstraints([usernameLabelWidth,usernameLabelHeight,usernameLabelCenterX,usernameLabelTop])
        
        let delimeterWidth = NSLayoutConstraint.init(item: delimeterLine, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0)
        let delimeterHeight = NSLayoutConstraint.init(item: delimeterLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1.0)
        let delimeterCenterX = NSLayoutConstraint.init(item: delimeterLine, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let delimeterBottom = NSLayoutConstraint.init(item: delimeterLine, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.addConstraints([delimeterWidth,delimeterHeight,delimeterCenterX,delimeterBottom])
    }

}
