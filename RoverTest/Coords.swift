//
//  Coords.swift
//  RoverTest
//
//  Created by Guillermo Zafra on 02/12/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

public typealias Coords = (x: Int, y: Int)

func += (left: inout Coords, right: Coords) {
    left = (left.0 + right.0, left.1 + right.1)
}

func == (left: Coords, right: Coords) -> Bool {
    return ((left.0 == right.0) && (left.1 == right.1))
}


