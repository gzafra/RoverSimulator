//
//  Rover.swift
//  RoverTest
//
//  Created by Guillermo Zafra on 02/12/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

enum RoverState {
    case idle
    case running
}

final class Rover {
    var commandsQueue: [Command]
    var currentDirection: Direction
    let identifier: Int
    var coords: Coords = (0, 0)
    var state: RoverState = .idle
    
    init(withIdentifier identifier: Int, startingDirection: Direction, commands: [Command] = []) {
        self.identifier = identifier
        self.currentDirection = startingDirection
        self.commandsQueue = commands
    }
}
