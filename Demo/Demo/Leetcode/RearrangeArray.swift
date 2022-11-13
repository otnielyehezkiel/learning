//
//  RearrangeArray.swift
//  Demo
//
//  Created by Otniel Hutabarat on 18/05/22.
//

import Foundation

struct RearrangeArray {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var negativeArr: [Int] = []
            
        var positiveArr: [Int] = []
            
        for num in nums {
            if num < 0 {
                negativeArr.append(num)
            }
            else {
                positiveArr.append(num)
            }
        }
        
        var result: [Int] = []
        for i in 0 ..< negativeArr.count  {
            result.append(positiveArr[i])
            result.append(negativeArr[i])
        }
        
        return result
    }
}
