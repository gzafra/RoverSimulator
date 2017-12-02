//
//  RoverTestTestTests.swift
//  RoverTestTestTests
//
//  Created by Guillermo Zafra on 29/03/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import XCTest
@testable import RoverTestTest

class RoverTestTestTests: XCTestCase {
    
    var roversManager: RoversManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        roversManager = RoversManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        roversManager = nil
    }
    
    func testSimpleMovement() {
        let orders: [Orders] = [.forward, .right, .forward]
        roversManager.simulateWithOrders(orders)
        assert(roversManager.finalPosition == (1, 1), "Simple movement failed")
    }
    
    func testNorthWall() {
        let orders: [Orders] = [.forward, .forward, .forward, .forward, .forward, .forward]
        roversManager.simulateWithOrders(orders)
        assert(roversManager.finalPosition == (0, 4), "North wall test failed")
    }
    
    func test360Rotation() {
        let orders: [Orders] = [.right, .right, .right, .right, .forward]
        roversManager.simulateWithOrders(orders)
        assert(roversManager.finalPosition == (0, 1), "360 Rotation failed")
    }
    
}
