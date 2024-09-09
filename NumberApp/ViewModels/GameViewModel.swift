import Foundation

class GameViewModel {
    
    weak var delegate: GameViewModelDelegate?
    
    private let gameManager = GameManager()
    
    private(set) var numArray: [Int] = []
    private(set) var sumValues: [Int] = []
    private(set) var targetnumLabel: String = ""
    private(set) var countnumLabel: String = ""
    private(set) var sumViewItemCount = 0
    private var arrayEndRange = 0
    private var arrayStartRange = 0
    private var realSumArray: [Int] = []
    private var sum = 0
    var levelCount: String = ""
    private var remainingTime = 60
    private var timer: Timer?
    
    func fetchDetails() {
        guard let (targetnumber, sumArray, SumArrayCount) = gameManager.getValues(from: gameManager.numberData, level: levelCount) else {
            return
        }
        
        targetnumLabel = "\(targetnumber)"
        countnumLabel = "\(SumArrayCount)"
        arrayEndRange = targetnumber
        arrayStartRange = targetnumber / SumArrayCount
        realSumArray = sumArray
        sumViewItemCount = SumArrayCount
        
        delegate?.didUpdateTargetNum(targetnumLabel)
        delegate?.didUpdateCountNum(countnumLabel)
        
        numArray = gameManager.generateRandomValues(numSumarray: realSumArray, Arraycount: sumViewItemCount, range: arrayStartRange..<arrayEndRange)
        numArray.shuffle()
        
    }
    
    func getSumValues(index: Int) {
        let selectedNum = numArray[index]
        guard !sumValues.contains(selectedNum), sumValues.count < sumViewItemCount else {
            return
        }
        
        sumValues.append(selectedNum)
        let sumText = sumValues.map { String($0) }.joined(separator: " + ")
        
        if sumValues.count == sumViewItemCount {
            sum = sumValues.reduce(0, +)
            let finalSumText = "\(sumText) = \(sum)"
            delegate?.didUpdateSumValues(finalSumText)
        } else {
            delegate?.didUpdateSumValues(sumText)
        }
    }
    
    func result() {
        let isSuccess = sum == arrayEndRange
        delegate?.didUpdateResult(isSuccess)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func endTimer() {
        timer?.invalidate()
        timer = nil
    }
    @objc private func updateTime() {
        if remainingTime > 0 {
            remainingTime -= 1
            delegate?.didUpdateTimer(time:remainingTime)
        } else {
            endTimer()
            delegate?.didEndTimer()
            
        }
    }
}

