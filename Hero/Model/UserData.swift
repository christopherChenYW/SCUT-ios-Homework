//
//  UserData.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/9.
//

import SwiftUI
import Combine

final class UserData: ObservableObject   {
    var objectWillChange=PassthroughSubject<UserData,Never>()
    var userlandMarks=landMarks{
        didSet{
            objectWillChange.send(self)
    }
    }
}
