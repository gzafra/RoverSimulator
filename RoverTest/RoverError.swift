//
//  RoverError.swift
//  RoverTest
//
//  Created by Guillermo Zafra on 02/12/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

enum RoverError: Error {
    case invalidCoords(reason: InvalidCoords)
    case whatever
}

enum InvalidCoords: Error {
    case outOfBounds
    case notEmptySpace
}
