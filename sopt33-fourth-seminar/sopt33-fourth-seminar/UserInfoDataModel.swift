//
//  UserInfoDataModel.swift
//  sopt33-fourth-seminar
//
//  Created by 최서연 on 11/11/23.
//

import Foundation

struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
    }
}

struct isExist: Codable {
    let isExist: Bool
}
