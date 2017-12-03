//
//  RoversManager.swift
//  RoverTestTest
//
//  Created by Guillermo Zafra on 29/03/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

public final class RoversManager: NSObject {
    
    private let gridSize: Size
    private let area: Area
    private var rovers = [Rover]()
    var finishedProcessing: Bool {
        return (rovers.reduce(0) {$0 + $1.commandsQueue.count } == 0)
    }
    
    init(withSize size: Size) {
        gridSize = size
        area = Area(with: gridSize)
    }
    
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
    
    func processRoverCommands() {
        for rover in rovers {
            guard !rover.commandsQueue.isEmpty else {
                continue
            }
            
            let nextOrder = rover.commandsQueue.removeFirst()
            rover.state = rover.commandsQueue.count == 0 ? .idle : .running
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
                continue
            }
            
            rover.coords = projectedPosition
            rover.currentDirection = currentDirection
        }
    }
    
    func simulateScenario() {
        while !finishedProcessing {
            processRoverCommands()
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
