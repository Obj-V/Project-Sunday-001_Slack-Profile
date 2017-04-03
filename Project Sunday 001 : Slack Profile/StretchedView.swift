//
//  StretchedView.swift
//  Project Sunday 001 : Slack Profile
//
//  Created by Virata Yindeeyoungyeon on 3/31/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

class StretchedView: UIView {

    var profileImageView:UIImageView!
    var shadowView:UIView!
    var nameLabel:UILabel!
    var usernameLabel:UILabel!
    var statusImageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        profileImageView = UIImageView(frame: self.bounds)
        self.addSubview(profileImageView)
        
        shadowView = UIView(frame: self.bounds)
        shadowView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.08)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shadowView)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        nameLabel.textColor = UIColor.white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        usernameLabel = UILabel()
        usernameLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 12)
        usernameLabel.textColor = UIColor.white
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)
        
        statusImageView = UIImageView()
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.contentMode = UIViewContentMode.scaleToFill
        self.addSubview(statusImageView)
        
        setupContraints()
    }
    
    private func setupContraints() {
        //shadowView
        let views = ["shadowView":shadowView, "view":self]
        let shadowViewHorizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[shadowView]|", options: [], metrics: nil, views: views)
        let shadowViewVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[shadowView]|", options: [], metrics: nil, views: views)
        self.addConstraints(shadowViewHorizontalContraints+shadowViewVerticalConstraints)
        
        //nameLabel
        let nameLabelBottomY = self.bounds.height/10
        let nameLabelHeight = nameLabelBottomY/2
        let nameLabelHorizontalConstraint = NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)
        let nameLabelVerticalConstraint = NSLayoutConstraint(item: nameLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -nameLabelBottomY)
        let nameLabelHeightConstraint = NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: nameLabelHeight)
        self.addConstraints([nameLabelHorizontalConstraint,nameLabelVerticalConstraint,nameLabelHeightConstraint])
        
        //usernameLabel
        let usernameLabelHorizontalConstraint = NSLayoutConstraint(item: usernameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)
        let usernameLabelVerticalConstraint = NSLayoutConstraint(item: usernameLabel,attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 0)
        let usernameLabelHeightConstraint = NSLayoutConstraint(item: usernameLabel, attribute: .height, relatedBy: .equal, toItem: nameLabel, attribute: .height, multiplier: 1.0, constant: 0)
        self.addConstraints([usernameLabelHorizontalConstraint,usernameLabelVerticalConstraint,usernameLabelHeightConstraint])
        
        //statusImageView
        let statusViewRatioConstraint = NSLayoutConstraint(item: statusImageView, attribute: .width, relatedBy: .equal, toItem: statusImageView, attribute: .height, multiplier: 1.0, constant: 0)
        let statusViewHeightConstraint = NSLayoutConstraint(item: statusImageView, attribute: .height, relatedBy: .equal, toItem: usernameLabel, attribute: .height, multiplier: 0.5, constant: 0)
        let statusViewLeadingConstraint = NSLayoutConstraint(item: statusImageView, attribute: .left, relatedBy: .equal, toItem: usernameLabel, attribute: .right, multiplier: 1.0, constant: 5)
        let statusViewCenterYConstraint = NSLayoutConstraint(item: statusImageView, attribute: .centerY, relatedBy: .equal, toItem: usernameLabel, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.addConstraints([statusViewRatioConstraint,statusViewHeightConstraint,statusViewLeadingConstraint,statusViewCenterYConstraint])
    }
}

