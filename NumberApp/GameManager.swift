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
        var randomValues: [Int] = []
                
        while randomValues.count < requiredCount {
            let randomValue = Int.random(in: range)
            if !numberArray.contains(randomValue) && !randomValues.contains(randomValue) {
                randomValues.append(randomValue)
            }
        }
            numberArray.append(contentsOf: randomValues)
            return randomValues
    }
}
