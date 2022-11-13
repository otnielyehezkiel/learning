//
//  ContainerWithMostWater.swift
//  Demo
//
//  Created by Otniel Hutabarat on 26/04/22.
//

import Foundation

struct ContainerWithMostWater {
    func maxArea(_ height: [Int]) -> Int {
        // indexMax: value
        var maxTuple: (index: Int, value: Int) = (-1, -1)
        var minTuple: (index: Int, value: Int) = (Int(INT_MAX), Int(INT_MAX))

        var maxArea: Int = -1
        for (index, number) in height.enumerated() {
            print("index: \(index) number: \(number)")
            var areaForHigh: Int = 0
            var areaForLow: Int = 0
            
            if maxTuple.value < number {
                areaForHigh = (index - maxTuple.index) * maxTuple.value
                maxTuple = (index, number)
                print("maxTuple: \(maxTuple)")
            }
            else {
                areaForHigh = (index - maxTuple.index) * number
            }
            
            if minTuple.value > number,
                minTuple.index > index {
                minTuple = (index, number)
                print("minTuple: \(minTuple)")
            }
            
            
            if minTuple.value < maxTuple.value {
                areaForLow = minTuple.value * (index - minTuple.index)
            }
            
            print("areaForHigh: \(areaForHigh) areaForLow: \(areaForLow)")
            let maxAreaForAll: Int = max(areaForHigh, areaForLow)
            if maxArea <  maxAreaForAll {
                maxArea = maxAreaForAll
            }
            print("area:" +  "\(maxArea)")
        }
        print("-----------")
        return maxArea
    }
    
    func bruteForceMaxArea(_ height: [Int]) -> Int {
        var maxArea: Int = -1
        for i in 0 ..< height.count {
            for j in i + 1 ..< height.count {
                let area: Int = min(height[i], height[j]) * (j - i)
                print("i: \(i) j: \(j) - area: \(area)")
                if maxArea < area {
                    maxArea = area
                }
            }
        }
        print("-----------")
        return maxArea
    }
    
    func efficientMaxArea(_ height: [Int]) -> Int {
        var leftIndex: Int = 0
        var rightIndex: Int = height.count - 1
        var area: Int = 0
        while leftIndex < rightIndex {
            area = max(area, min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex))
            
            if height[leftIndex] > height[rightIndex] {
                rightIndex -= 1
            }
            else {
                leftIndex += 1
            }
        }
        
        return area
    }
}
