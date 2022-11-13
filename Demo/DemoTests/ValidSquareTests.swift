//
//  ValidSquareTests.swift
//  DemoTests
//
//  Created by Otniel Hutabarat on 01/02/22.
//

@testable import Demo
import Foundation
import XCTest

/// https://leetcode.com/problems/valid-square/
class ValidSquareTests: XCTestCase {
    func test_validSquare_returnCorrectAnswers() {
        // Given
        let pointTuple = (p1: [0, 0], p2: [1, 1], p3: [1, 0], p4: [0, 1])
        let pointTuple2 = (p1: [0, 0], p2: [1, 1], p3: [1, 0], p4: [0, 12])
        let pointTuple3 = (p1: [0, 0], p2: [5, 0], p3: [5, 4], p4: [0, 4])
        let points4: [[Int]] = [
            [1, 1],
            [5, 3],
            [3, 5],
            [7, 7]
        ]
        let points5: [[Int]] = [
            [0,0],
            [1,1],
            [0,0],
            [1,1]
        ]
                
        // When
        let result = ValidSquare.isValid(p1: pointTuple.p1, p2: pointTuple.p2, p3: pointTuple.p3, p4: pointTuple.p4)
        let result2 = ValidSquare.isValid(p1: pointTuple2.p1, p2: pointTuple2.p2, p3: pointTuple2.p3, p4: pointTuple2.p4)
        let result3 = ValidSquare.isValid(p1: pointTuple3.p1, p2: pointTuple3.p2, p3: pointTuple3.p3, p4: pointTuple3.p4)
        let result4 = ValidSquare.isValid(p1: points4[0], p2: points4[1], p3: points4[2], p4: points4[3])
        let result5 = ValidSquare.isValid(p1: points5[0], p2: points5[1], p3: points5[2], p4: points5[3])


        // Then
        XCTAssertTrue(result)
        XCTAssertFalse(result2)
        XCTAssertFalse(result3)
        XCTAssertFalse(result4)
        XCTAssertFalse(result5)
    }
}
