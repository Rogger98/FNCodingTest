//
//  main.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit

private let fakeAppDelegateClass: AnyClass? = NSClassFromString("FNCodingTestTests.FakeFNAppDelegate")

private let appDelegateClass: AnyClass = fakeAppDelegateClass ?? FNAppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
