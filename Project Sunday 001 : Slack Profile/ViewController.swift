//
//  ViewController.swift
//  Project Sunday 001 : Slack Profile
//
//  Created by Virata Yindeeyoungyeon on 3/26/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Vars
    private var tableViewHeaderHeight:CGFloat!
    private var tableViewHeaderRect:CGRect!
    private var rowHeight:CGFloat!
    
    //Views
    @IBOutlet weak var tableView:UITableView!
    private var stretchedView:StretchedView!
    private var statusView:StatusView!
    private var closeButton:UIButton!
    
    //Models
    private var profileInfo:Dictionary<String, Any>!
    private var tableViewInfo:Array<Dictionary<String, String>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileInfo = ProfileModel.getProfileInfo()
        tableViewInfo = profileInfo["tableViewData"] as! Array
        rowHeight = self.view.bounds.height/10
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = nil
        tableViewHeaderHeight = self.view.bounds.midY
        tableViewHeaderRect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: tableViewHeaderHeight)
        tableView.contentInset = UIEdgeInsetsMake(tableViewHeaderHeight, 0, 0, 0);
        tableView.contentOffset = CGPoint(x: 0, y: -tableViewHeaderHeight);
        tableView.allowsSelection = false
        setupStatusView()
        setupCloseButton()
        setupStretchedHeaderView()
        updateStretchHeaderViewFrame()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func setupCloseButton() {
        closeButton = UIButton(type: UIButtonType.custom)
        closeButton.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
        closeButton.setTitle("X", for: UIControlState.normal)
        closeButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        closeButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        self.view.addSubview(closeButton)       
    }
    
    private func setupStatusView() {
        statusView = StatusView(frame: CGRect(x: 0, y: -rowHeight, width: self.view.bounds.size.width, height: rowHeight))
        statusView.alpha = 0
        statusView.nameLabel.text = profileInfo["name"] as? String
        statusView.usernameLabel.text = profileInfo["username"] as? String
        self.view.addSubview(statusView)
    }
    
    private func setupStretchedHeaderView() {
        stretchedView = StretchedView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: tableViewHeaderHeight))
        stretchedView.profileImageView.image = UIImage.init(named: (profileInfo["profileImageName"] as! String))
        stretchedView.nameLabel.text = profileInfo["name"] as? String
        stretchedView.usernameLabel.text = profileInfo["username"] as? String
        stretchedView.statusImageView.image = UIImage.init(named: (profileInfo["status"] as! String))
        tableView.addSubview(stretchedView)
    }
    
    private func updateStretchHeaderViewFrame() {
        //Adjust header frame
        var headerRect = CGRect(x: 0, y: -tableViewHeaderHeight, width: tableView.bounds.width, height: tableViewHeaderHeight)
        var imageRect = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableViewHeaderHeight)
        if tableView.contentOffset.y <= -tableViewHeaderHeight {
            let newHeight = -tableView.contentOffset.y
            let widthOffset = (newHeight - tableViewHeaderHeight)
            
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = newHeight
            
            imageRect.origin.x = -widthOffset/2
            imageRect.origin.y = 0
            imageRect.size.height = newHeight
            imageRect.size.width += widthOffset
        } else {
            let newOffset = -tableView.contentOffset.y > rowHeight ? -tableView.contentOffset.y : rowHeight
            tableView.contentInset = UIEdgeInsetsMake(newOffset!, 0, 0, 0);
            tableView.contentOffset = CGPoint(x: 0, y: -1*newOffset!);
        }
        
        stretchedView?.frame = headerRect
        stretchedView?.profileImageView.frame = imageRect
        
        //Hide-Show statusView
        if (-tableView.contentOffset.y >= tableViewHeaderHeight/2) {
            hideStatusView()
        } else {
            showStatusView()
        }
    }
    
    private func showStatusView() {
        if (statusView?.frame.origin.y == -rowHeight) {
            var finalFrame = statusView.frame
            finalFrame.origin.y = 0
            UIView.animate(withDuration: 0.2, animations: {
                self.statusView.frame = finalFrame
                self.statusView.alpha = 1
                self.closeButton.setTitleColor(UIColor.black, for: UIControlState.normal)
            })
        }
    }
    
    private func hideStatusView() {
        if (statusView?.frame.origin.y == 0) {
            var finalFrame = statusView.frame
            finalFrame.origin.y = -rowHeight
            UIView.animate(withDuration: 0.2, animations: {
                self.statusView.frame = finalFrame
                self.statusView.alpha = 0
                self.closeButton.setTitleColor(UIColor.white, for: UIControlState.normal)
            })
        }
    }
    
    // MARK: scrollView's delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateStretchHeaderViewFrame()
    }
    
    // MARK: tableView's DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewInfo.count + 1 //+1 for EditCell, the rest is InfoCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = (indexPath.row == 0) ? "EditCell": "InfoCell";
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if (indexPath.row == 0 || indexPath.row == 3) {
            cell.separatorInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, cell.bounds.size.width)
        }
        
        if ((cell as? InfoCell) != nil) {
            let infoCell = cell as! InfoCell
            let infoRow = indexPath.row-1
            let infoData = tableViewInfo[infoRow] 
            infoCell.titleLabel.text = infoData["Title"]
            infoCell.subtitleLabel.text = infoData["Subtitle"]
        }
        return cell
    }
    
    // MARK: tableView's Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }

}

