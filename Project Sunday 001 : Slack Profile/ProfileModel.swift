//
//  ProfileModel.swift
//  Project Sunday 001 : Slack Profile
//
//  Created by Virata Yindeeyoungyeon on 3/28/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

struct ProfileModel {
    
    static func getProfileInfo() -> [String:AnyObject] {
        return ["profileImageName":"ProfilePic" as AnyObject,
                "name":"Viiiiiii rata" as AnyObject,
                "username":"@ObjV" as AnyObject,
                "status":"online" as AnyObject,
                "tableViewData":[["Title":"What I do", "Subtitle":"iOS Developer"],
                                 ["Title":"Timezone", "Subtitle":"11:48 PM local time"],
                                 ["Title":"Email", "Subtitle":"ObjV@example.com"]] as AnyObject]
    }
    
}
