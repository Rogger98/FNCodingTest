//
//  Environment.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Foundation


struct Environment {
    
    /// Current Web application version
    static let version: String = "v1?"
    
    /// End point for current app Environment i.e , Pre-prod, Prod
    static var baseUrl : String {
        return "https://poi-api.mytaxi.com/PoiService/poi/" + version
    }
}
