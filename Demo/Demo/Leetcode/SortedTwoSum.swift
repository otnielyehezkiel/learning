//
//  SortedTwoSum.swift
//  Demo
//
//  Created by Otniel Hutabarat on 25/04/22.
//

import Foundation

struct SortedTwoSum {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for (index, number) in numbers.enumerated() {
            dict[number] = index
        }
        
        for (index, number) in numbers.enumerated() {
            let diff = target - number
            if let val: Int = dict[diff] {
                return [index + 1, val + 1]
            }
        }
        
        return []
    }
    
    func twoSumUsingPointer(_ numbers: [Int], _ target: Int) -> [Int] {
        var rightIndex: Int = numbers.count - 1
        var leftIndex: Int = 0

        while leftIndex < rightIndex {
            if numbers[leftIndex] + numbers[rightIndex] == target {
                print("founded")
                return [leftIndex+1, rightIndex+1]
            }
            else if numbers[leftIndex] + numbers[rightIndex] > target {
                rightIndex -= 1
                print("right: " + "\(numbers[rightIndex])")
            }
            else if numbers[leftIndex] + numbers[rightIndex] < target {
                leftIndex += 1
                print("leftIndex: " + "\(numbers[leftIndex])")
            }
        }
        
        return []
    }
}
