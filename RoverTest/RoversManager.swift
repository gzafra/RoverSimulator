//
//  RoversManager.swift
//  RoverTestTest
//
//  Created by Guillermo Zafra on 29/03/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

public class RoversManager: NSObject {
    
    static let gridSize: Size = (5, 5)
    private let area = Area(with: gridSize)
    private var rovers = [Rover]()
    
    public var initialPoint: Coords = (0, 0)
    public var initialDirection: Direction = .north
    
    public var finalPosition: Coords!
    
    func add(rover: Rover, at coords: Coords) throws {
        guard isValid(coords: coords) else {
            throw RoverError.invalidCoords(reason: .outOfBounds)
        }
        
        guard rovers.filter({ $0.coords == coords }).first == nil else  {
            throw RoverError.invalidCoords(reason: .notEmptySpace)
        }
        
        guard area.matrix[coords.x, coords.y] is EmptySpace else {
            throw RoverError.invalidCoords(reason: .notEmptySpace)
        }
        
        rover.coords = coords
        rovers.append(rover)
    }
    
    func processRoverOrders() {
        for rover in rovers {
            guard !rover.commandsQueue.isEmpty else {
                rover.state = .idle
                continue
            }
            
            rover.state = .running
            let nextOrder = rover.commandsQueue.removeFirst()
            var projectedPosition = rover.coords
            var currentDirection = rover.currentDirection
            
            switch nextOrder {
            case .left: // anti clock wise
                currentDirection = Direction(rawValue: (currentDirection.rawValue + 3) % 4)!
            case .right: // clock wise
                currentDirection = Direction(rawValue: (currentDirection.rawValue + 1) % 4)!
            case .forward:
                projectedPosition += currentDirection.movementMod()
            }
            
            // Validate the coords the rover would move on are valid
            guard isValid(coords: projectedPosition) else {
                return
            }
            
            rover.coords = projectedPosition
        }
    }
    
    func isValid(coords: Coords) -> Bool {
        if (coords.x >= 0  && coords.x < area.matrix.columns) &&
            (coords.y >= 0 && coords.y < area.matrix.rows) {
            return true
        }
        return false
    }
}
