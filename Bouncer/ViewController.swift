//
//  ViewController.swift
//  Bouncer
//
//  Created by Екатерина Колесникова on 30.03.15.
//  Copyright (c) 2015 kkate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bounser = BouncerBehavior()

    lazy var animator: UIDynamicAnimator = { UIDynamicAnimator(referenceView: self.view) }()

    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(bounser)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if (redBlock == nil) {
            redBlock = addBlock()
            redBlock?.backgroundColor = UIColor.redColor()
            bounser.addBlock(redBlock!)
        }

        let manager = AppDelegate.Motion.Manager
        if manager.deviceMotionAvailable {
            manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void  in
                    self.bounser.gravity.gravityDirection = CGVector(dx: data.acceleration.x, dy: -data.acceleration.y)
            }
        }

    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.Motion.Manager.stopAccelerometerUpdates()
    }

    var redBlock: UIView?

    struct Constants {
        static let BlockSize = CGSize(width: 40, height: 40)
    }

    func addBlock() -> UIView {
        let block = UIView(frame: CGRect(origin: CGPoint.zeroPoint, size: Constants.BlockSize))
        block.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        view.addSubview(block)
        return block
    }
}

