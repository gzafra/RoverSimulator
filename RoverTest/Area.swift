//
//  Grid.swift
//  RoverTest
//
//  Created by Guillermo Zafra on 02/12/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

typealias Size = (width: Int, height: Int)

struct Area {
    var matrix: Matrix

    init(with size: Size) {
        self.matrix = Matrix(rows: size.width, columns: size.height)
    }
}

protocol GridSpace {}

struct Obstacle: GridSpace {}

struct EmptySpace: GridSpace {}
