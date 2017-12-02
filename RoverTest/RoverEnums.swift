//
//  RoverEnums.swift
//  RoverTest
//
//  Created by Guillermo Zafra on 02/12/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

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

enum Command: String {
    case left
    case right
    case forward
}
