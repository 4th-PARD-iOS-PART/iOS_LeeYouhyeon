//
//  Member.swift
//  6st_hw_LeeYouhyeon
//
//  Created by 이유현 on 11/1/24.
//

import Foundation

struct Member: Codable {
    var id : Int
    var name : String
    var part : String
    var age : Int
}

struct SendMember: Codable {
    var name : String
    var part : String
    var age : Int
}
