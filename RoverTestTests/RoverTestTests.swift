//
//  RoverTestTestTests.swift
//  RoverTestTestTests
//
//  Created by Guillermo Zafra on 29/03/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import XCTest
@testable import RoverTest

class RoverTestTestTests: XCTestCase {
    
    var roversManager: RoversManager!
    let gridSize: Size = (5,5)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        roversManager = RoversManager(withSize: gridSize)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        roversManager = nil
    }
    
    func testSimpleMovement() {
        let orders: [Command] = [.forward, .right, .forward]
        let rover = Rover(withIdentifier: 1, startingDirection: .south, commands: orders)
        try! roversManager.add(rover: rover, at: (0,0))
        roversManager.simulateScenario()
        XCTAssertTrue(roversManager.finishedProcessing)
        let expectedCoords: Coords = (1,1)
        XCTAssert(rover.coords == expectedCoords)
        XCTAssertEqual(rover.state, .idle)
        XCTAssert(roversManager.finishedProcessing)

    }
    
    func testWall() {
        let orders: [Command] = [.forward, .forward, .forward, .forward, .forward, .forward]
        let rover = Rover(withIdentifier: 1, startingDirection: .south, commands: orders)
        try! roversManager.add(rover: rover, at: (0,0))
        roversManager.simulateScenario()
        XCTAssertTrue(roversManager.finishedProcessing)
        let expectedCoords: Coords = (0, gridSize.height-1)
        XCTAssert(rover.coords == expectedCoords)
        XCTAssertEqual(rover.state, .idle)
        XCTAssert(roversManager.finishedProcessing)
    }
    
    func test360Rotation() {
        let orders: [Command] = [.right, .right, .right, .right, .forward]
        let rover = Rover(withIdentifier: 1, startingDirection: .south, commands: orders)
        try! roversManager.add(rover: rover, at: (0,0))
        roversManager.simulateScenario()
        XCTAssertTrue(roversManager.finishedProcessing)
        let expectedCoords: Coords = (0, 1)
        XCTAssert(rover.coords == expectedCoords)
        XCTAssertEqual(rover.state, .idle)
        XCTAssert(roversManager.finishedProcessing)
    }
    
}
