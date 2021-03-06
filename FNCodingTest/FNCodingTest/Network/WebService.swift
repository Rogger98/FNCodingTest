//
//  WebService.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Alamofire
import Foundation

/// `APIResult` takes the responsblity of web service response.
enum APIResult<T> {
    case success(T)
    case error(WebError)
}

/// `ResponseError` defines the back-end error from webservices.
struct ResponseError : Decodable {
    var timestamp: Generic?
    var status: Generic?
    var error: Generic?
    var message : Generic?
    var path : Generic?
}

/// `WebError` defines the web services error.
enum WebError {
    case backendError(ResponseError)
    case decodingFailed
    case notDataFound
    case networkError(AFError)
    case noInternet
}


/// `WebServics` takes the responsblity of calling web services.
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
        if NetworkReachabilityManager()?.isReachable ?? false {
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
        } else {
            complition(.error(.noInternet))
        }
        
    }
}

