//
//  Environment.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Foundation


/// `Environment` takes the responsblity of Application environment for all library, webservices.
struct Environment {
    
    
    /// End point for current app Environment i.e , Pre-prod, Prod
    static var baseUrl : String {
        return "https://poi-api.mytaxi.com/"
    }
    
    /// All WebService Module/Service
    enum Module {
        
        case poiService
        
        var name : String {
            switch self {
            case .poiService:
                return "PoiService/poi/"
            }
        }
    }
    
    /// Current Web application version
    static let version: String = "v1?"
        
    /// get Url for Module/Service i.e POIService
    static var urlFor: ((Module) -> String) = { (module) in
        return baseUrl + module.name + version
    }
        
}
