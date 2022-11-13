//
//  ValidSquare.swift
//  Demo
//
//  Created by Otniel Hutabarat on 01/02/22.
//

import Foundation

struct ValidSquare {
    typealias Pair = [Int]
    
    static func isValid(p1: Pair, p2: Pair, p3: Pair, p4: Pair) -> Bool {
        var distanceSquareds: [Int] = []
        
        guard p1 != p2, p1 != p3, p1 != p4, p2 != p3, p2 != p4, p3 != p4 else { return false }
        
        distanceSquareds.append(
            distanceSquared(p1: p1,
                            p2: p2)
        )
        distanceSquareds.append(
            distanceSquared(p1: p1,
                            p2: p3)
        )
        distanceSquareds.append(
            distanceSquared(p1: p1,
                            p2: p4)
        )
        distanceSquareds.append(
            distanceSquared(p1: p2,
                            p2: p3)
        )
        distanceSquareds.append(
            distanceSquared(p1: p2,
                            p2: p4)
        )
        distanceSquareds.append(
            distanceSquared(p1: p3,
                            p2: p4)
        )
        
        var totalLength: [Int: Int] = [:]
        
        distanceSquareds.forEach { distance in
            if totalLength[distance] == nil {
                totalLength[distance] = 1
            }
            else {
                totalLength[distance]? += 1
            }
        }
        dump(distanceSquareds)
        dump(totalLength)
        
        guard totalLength.count == 2,
              totalLength.contains(where: { _, value in
                  (value == 4) || (value == 2)
              })
        else {
            return false
        }
        
        return true
    }
    
    static func distanceSquared(p1: Pair, p2: Pair) -> Int {
        let deltaX: Int = p2[0] - p1[0]
        let deltaY: Int = p2[1] - p1[1]
        return deltaX * deltaX + deltaY * deltaY
    }
}
