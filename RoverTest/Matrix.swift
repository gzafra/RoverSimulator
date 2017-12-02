//
//  Matrix.swift
//  RoverTest
//
//  Created by Guillermo Zafra on 02/12/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import Foundation

struct Matrix {
    let rows: Int, columns: Int
    var grid: [GridSpace]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: EmptySpace(), count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> GridSpace {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
