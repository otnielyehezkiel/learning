//
//  ViewModel.swift
//  Demo
//
//  Created by Otniel Hutabarat on 01/02/22.
//

import Foundation

struct MergeIntervals {
    private typealias Pair = (start: Int, end: Int)
    
    static func merge(intervals: [[Int]]) -> [[Int]] {
        // O(n)
        let pairs: [Pair] = intervals.compactMap {
            return (start: $0[0], end: $0[1])
        }
        
        //  O(n log n)
        let sortedPairs: [Pair] = pairs.sorted(by: { $0.start < $1.start })
        
        var newPairs: [Pair] = [sortedPairs.first]
            .compactMap { $0 }
        
        // O(n)
        for pair in sortedPairs.dropFirst() { // dropFirst = O(1)
            if let lastPair: Pair = newPairs.last,
               lastPair.end >= pair.start {
                newPairs.removeLast() // O(1)
                // O(1)
                newPairs.append(
                    mergePair(left: lastPair,
                              right: pair)
                )
            }
            else {
                newPairs.append(pair)
            }
        }
        
        // O(n)
        return newPairs.map { [$0.start, $0.end] }
    }
    
    private static func mergePair(left:  Pair, right:  Pair) -> Pair {
        return (start: min(left.start, right.start), end: max(left.end, right.end))
    }
}
