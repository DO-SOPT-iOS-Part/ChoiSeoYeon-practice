//
//  RegisterService.swift
//  sopt33-fourth-seminar
//
//  Created by 최서연 on 11/11/23.
//

import Foundation

class RegisterService {
    static let shared = RegisterService() // -> shared: 하나의 인스턴스 객체 생성
    private init() {}  // 싱글톤 패턴
    // 하나의 인스턴스만을 생성 -> 다른 뷰컨에서 해당 값을 바꿔도 같은 놈의 값을 바꾸는 것
    // 해당 인스턴스에 의존하는 뷰컨이 많아질수록 오류가 생겼을 때 오류 수정이 어려워짐
    // 하지만 매우 좋은 패턴임. 너무너무 남용하면 안좋겠지?
    
    func makeRequestBody(userName: String,
                         password: String,
                         nickName: String) -> Data? {
        do {
            let data = RegisterRequestBody(username: userName,
                                           password: password,
                                           nickname: nickName)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }

    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func PostRegisterData(userName: String,
                          password: String,
                          nickName: String) async throws -> Int {

        do {
            guard let body = makeRequestBody(userName: userName,
                                             password: password,
                                             nickName: nickName)
            else { throw NetworkError.responseDecodingError } // 디코딩에러로 수정

            let request = self.makeRequest(body: body)
            
            let (_, response) = try await URLSession.shared.data(for: request)
            dump(request) // 콘솔창에서 request값 확인 가능
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }

            dump(response) // 콘솔창에서 response값 확인 가능
            return httpResponse.statusCode
        } catch {
            throw error
        }
        
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
