//
//  WebService.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Alamofire
import Foundation

enum APIResult<T> {
    case success(T)
    case error(WebError)
}

struct ResponseError : Decodable {
    var timestamp: String
    var status: Int
    var error: String
    var message : String
    var path : String
}
enum WebError {
    case backendError(ResponseError)
    case decodingFailed
    case notDataFound
    case networkError(AFError)
}

final class WebServics: Session {
    
    /// Shared instance for Web service call's
    static var shared: WebServics = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 60
        configuration.timeoutIntervalForRequest = 60
        configuration.httpMaximumConnectionsPerHost = 20
        
        var webService = WebServics(configuration: configuration)
        return webService
    }()
    
    /// Make Webserive Call
    func makeRequest<T: Codable>(type: T.Type,router: Router,complition: @escaping  (_ result: APIResult<T>) -> Void) {
        AF.request(router.path).responseData { (response) in
            switch response.result {
            case .failure(let error):
                complition(.error(.networkError(error)))
            case .success(let value):
                do {
                    let resultData = try JSONDecoder().decode(type.self, from: value)
                    complition(.success(resultData))
                } catch {                    
                    if let backendError = try? JSONDecoder().decode(ResponseError.self, from: value) {
                        complition(.error(.backendError(backendError)))
                    } else {
                        complition(.error(.decodingFailed))
                    }
                }
            }
        }
    }
}
// https://poi-api.mytaxi.com/PoiService/poi/v1?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891
