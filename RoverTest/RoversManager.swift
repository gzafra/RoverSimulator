//
//  RoversManager.swift
//  RoverTestTest
//
//  Created by Guillermo Zafra on 29/03/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import UIKit

/* TODO: Could actually avoid the whole manager and just return the final position but a more complex approach
 could definitely benefit from a manager that handles all the logic.
*/

// MARK: - Enums
public enum Direction: Int {
    case north = 0
    case east
    case south
    case west
    
    func movementMod() -> Coords {
        switch self {
        case .north:
            return (0, 1)
        case .south:
            return (0, -1)
        case .east:
            return (1, 0)
        case .west:
            return (-1, 0)
        }
    }
}

enum Orders: String {
    case left
    case right
    case forward
}

// MARK: - Utility

func += (left: inout Coords, right: Coords) {
    left = (left.0 + right.0, left.1 + right.1)
}

func == (left: Coords, right: Coords) -> Bool {
    return ((left.0 == right.0) && (left.1 == right.1))
}

public typealias Coords = (x: Int, y: Int)

public class RoversManager: NSObject {
    
    public var gridSize: Coords = (5, 5)
    public var initialPoint: Coords = (0, 0)
    public var initialDirection: Direction = .north
    
    public var finalPosition: Coords!

    /// Receives an array of orders and simulatest movement of the rover
    func simulateWithOrders(_ arrayOfOrders: [Orders]) {
        var currentPosition = initialPoint
        var projectedPosition = currentPosition
        var currentDirection = initialDirection
        
        for order in arrayOfOrders {
            
            switch order {
            case .left: // anti clock wise
                currentDirection = Direction(rawValue: (currentDirection.rawValue + 3) % 4)!
            case .right: // clock wise
                currentDirection = Direction(rawValue: (currentDirection.rawValue + 1) % 4)!
            case .forward:
                projectedPosition += currentDirection.movementMod()
            }
            
            // Validate the coords the rover has moved on are valid
            guard validCoords(projectedPosition) else {
                print("Found wall, ignoring movement")
                projectedPosition = currentPosition
                continue
            }
            
            currentPosition = projectedPosition
        }
        
        finalPosition = currentPosition
        print("Final position: X: \(currentPosition.x) Y: \(currentPosition.y)")
    }
    
    func validCoords(_ coords: Coords) -> Bool {
        if (coords.x >= 0  && coords.x < gridSize.x) &&
            (coords.y >= 0 && coords.y < gridSize.y) {
            return true
        }
        return false
    }
}
