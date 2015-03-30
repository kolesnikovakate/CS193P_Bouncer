//
//  AppDelegate.swift
//  Bouncer
//
//  Created by Екатерина Колесникова on 30.03.15.
//  Copyright (c) 2015 kkate. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    struct Motion {
        static let Manager = CMMotionManager()
    }
}

