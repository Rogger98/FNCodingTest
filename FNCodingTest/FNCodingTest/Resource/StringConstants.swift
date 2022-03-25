//
//  StringConstants.swift
//  FNCodingTest
//
//  Created by psagc on 25/03/22.
//

import Foundation

/// Helper for Localizing strings.
protocol StringLocalizable {

    /// The namespace used in the Localizable.strings files
    static var prefix: String { get }
}

extension StringLocalizable where Self: RawRepresentable, Self.RawValue == String {

    /// Formatted key used in the Localizable.strings files.
    var localized: String {
        let key = "\(Self.prefix).\(rawValue)"
        return NSLocalizedString(key, tableName: "Localizable", value: "**\(key)**", comment: "")
    }
}

struct StringConstants {

    enum Common: String, StringLocalizable {
        case ok
        case cancel
        case networkIssue
        case somethingWentwrong
        case sorry
        case serverError
        case serverErrorDescription
        case noInternet
        case noInternetDescription
        static var prefix: String { return "Common" }
    }
    
    enum VehicleScreen : String, StringLocalizable {
        case vehicle
        case loadingMessage
        case noVehiclesAvailable
        static var prefix: String { return "VehicleScreen" }
    }
    
}
