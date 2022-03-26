//
//  DispatchQueue+Extention.swift
//  FNCodingTest
//
//  Created by psagc on 24/03/22.
//

import Foundation

protocol DispatchQueueHelperType {
    static func dispatchToMainQueueSync(_ block: () -> Void)
}

extension DispatchQueue: DispatchQueueHelperType {
    public static func dispatchToMainQueueSync(_ block: () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.sync {
                block()
            }
        }
    }
}
