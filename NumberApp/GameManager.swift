//
//  GameManager.swift
//  NumberApp
//
//  Created by Vani on 8/31/24.
//

import Foundation

 class GameManager {
    
    var numberArray: [Int] = []
    
    func getValues(from data: [NumberDataModel]) -> (Int, Int, [Int])? {
        guard !data.isEmpty else { return nil }
        let randomModel = data.randomElement()!
        let targetNumber = randomModel.number
        let randomCount = randomModel.counts.randomElement()!
        let sumArray = randomCount.randomElement()!
        let count = sumArray.count
        
        numberArray = sumArray
        
        return (targetNumber, count, sumArray)
    }
    
    func generateRandomValues(Arraycount: Int, range: Range<Int>) -> [Int] {
        let requiredCount = 24 - numberArray.count
        guard requiredCount > 0 else { return [] }
                
        let randomValues = (0..<requiredCount).map { _ in Int.random(in: range) }
        numberArray.append(contentsOf: randomValues)
            return randomValues
        }
    }
