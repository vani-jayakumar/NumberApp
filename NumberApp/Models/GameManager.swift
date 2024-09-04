//
//  GameManager.swift
//  NumberApp
//
//  Created by Vani on 8/31/24.
//

import Foundation

 class GameManager {
    
    var numberData: [NumberDataModel] = []
    
    public init () {
        DBManager.shared.loadData(fileName: "Data" ) { data in
            self.numberData = data ?? []
        }
    }
    
    func getValues(from data: [NumberDataModel], level: String) -> (Int, [Int], Int)? {
        let randomModel = data.randomElement()!
        let targetNumber = randomModel.number
        var sumArray: [Int]
        var sumArrayCount: Int = 0
        switch level {
        case "two":
            sumArray = randomModel.counts.two.randomElement()!
            sumArrayCount = sumArray.count
        case "three":
            sumArray = randomModel.counts.three.randomElement()!
            sumArrayCount = sumArray.count
        case "four":
            sumArray = randomModel.counts.four.randomElement()!
            sumArrayCount = sumArray.count
        case "five":
            sumArray = randomModel.counts.five.randomElement()!
            sumArrayCount = sumArray.count
        default:
            sumArray = []
        }
        
        return (targetNumber, sumArray, sumArrayCount)
    }
    
    func generateRandomValues(numSumarray: [Int], Arraycount: Int, range: Range<Int>) -> [Int] {
        let requiredCount = 24 - Arraycount
        var randomValues: [Int] = []
        var numberArray: [Int] = []
        numberArray.append(contentsOf: numSumarray)
                
        while randomValues.count < requiredCount {
            let randomValue = Int.random(in: range)
            if !numberArray.contains(randomValue) && !randomValues.contains(randomValue) {
                randomValues.append(randomValue)
            }
        }
            numberArray.append(contentsOf: randomValues)
            return numberArray
    }
}
