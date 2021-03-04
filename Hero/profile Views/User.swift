//
//  User.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/10.
//

import Foundation
struct User{
    var username:String
    var prefersNotifications=true
    var preferSeason=Season.spring
    var birthday=Date()
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
    static let `default`=Self(username:"Christopher")
}
