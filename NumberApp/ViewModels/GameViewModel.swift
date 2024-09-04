//
//  GameViewModel.swift
//  NumberApp
//
//  Created by Vani on 9/4/24.
//

import Foundation

class GameViewModel {
    
    let gameManager = GameManager()
    var sumViewItemCount = 0
    var arrayEndRange = 0
    var arrayStartRange = 0
    var numArray = [Int]()
    var realSumArray: [Int] = []
    var levelCount: String = ""
    var targetnumLabel: String = ""
    var countnumLabel: String = ""
    var sumValues : [Int] = []
    var sum = 0
    
    
     func fetchDetails() {
      if let (targetnumber,sumArray,SumArrayCount) = gameManager.getValues(from:gameManager.numberData, level: levelCount) {
        self.targetnumLabel = "\(targetnumber)"
        self.countnumLabel = "\(SumArrayCount)"
        self.arrayEndRange = targetnumber
        self.arrayStartRange = targetnumber/SumArrayCount
        self.realSumArray = sumArray
        self.sumViewItemCount = SumArrayCount
      }
      numArray = gameManager.generateRandomValues(numSumarray: realSumArray, Arraycount: sumViewItemCount, range: arrayStartRange..<arrayEndRange)
      numArray.shuffle()
    }
    
    func getSumValues(index: Int) -> String {
        let selectedNum = numArray[index]
        if !sumValues.contains(selectedNum) && sumValues.count < sumViewItemCount{
            sumValues.append(selectedNum)
        }
        let sumText = sumValues.map{ String($0) }.joined (separator: " + ")
        if sumValues.count == sumViewItemCount {
            sum = sumValues.reduce(0, +)
            let finalSumText  = "\(sumText) = \(sum)"
            return finalSumText
        }
        return sumText
    }
    func result() -> Bool {
        if sum == arrayEndRange {
            return true
        } else {
            return false
        }
    }
    
}

