//
//  NetworkError.swift
//  sopt33-fourth-seminar
//
//  Created by 최서연 on 11/11/23.
//

import Foundation

enum NetworkError: Int, Error, CustomStringConvertible {
    var description: String { self.errorDescription }
    case requstEncodingError
    case responseDecodingError
    case responseError
    case unknownError
    case loginFailed = 400
    case internalServerError = 500
    case notFoundError = 404
    case duplicateError = 800
    
    var errorDescription: String {
        switch self {
        case .loginFailed: return "로그인에 실패하였습니다."
        case .requstEncodingError: return "REQUEST_ENCODING_ERROR"
        case .responseError: return "RESPONSE_ERROR"
        case .responseDecodingError: return "RESPONSE_DECODING_ERROR"
        case .unknownError: return "UNKNOWN_ERROR"
        case .internalServerError: return "500:INTERNAL_SERVER_ERROR"
        case .notFoundError: return "404:NOT_FOUND_ERROR"
        case .duplicateError: return "username이 이미 존재합니다. 다른 값을 입력해주셈"
        }
    }
}
