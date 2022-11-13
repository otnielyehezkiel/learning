//
//  MergeIntervalsTests.swift
//  DemoTests
//
//  Created by Otniel Hutabarat on 01/02/22.
//

@testable import Demo
import XCTest

/// https://leetcode.com/problems/merge-intervals/solution/
class MergeIntervalsTests: XCTestCase {
    func test_mergeIntervals_returnCorrectAnswers() {
        // Given
        let intervals1: [[Int]] = [[1, 3], [2, 6], [8, 10], [16, 18]]
        let intervals2: [[Int]] = [[1, 4], [2, 3]]
        let intervals3: [[Int]] = [[1, 4], [4, 5]]

        // When
        let mergedIntervals1 = MergeIntervals.merge(intervals: intervals1)
        let mergedIntervals2 = MergeIntervals.merge(intervals: intervals2)
        let mergedIntervals3 = MergeIntervals.merge(intervals: intervals3)

        // Then
        let expectedIntervals1: [[Int]] = [[1, 6], [8, 10], [16, 18]]
        XCTAssertEqual(mergedIntervals1, expectedIntervals1)
        
        let expectedIntervals2: [[Int]] = [[1, 4]]
        XCTAssertEqual(mergedIntervals2, expectedIntervals2)
        
        let expectedIntervals3: [[Int]] = [[1, 5]]
        XCTAssertEqual(mergedIntervals3, expectedIntervals3)
    }
}
