//
//  GameViewController.swift
//  NumberApp
//
//  Created by Vani on 8/30/24.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var targetNumLabel: UILabel!
    @IBOutlet weak var countNumLabel: UILabel!
    @IBOutlet weak var sumCollectionView: UICollectionView!
    @IBOutlet weak var numCollectionView: UICollectionView!
    
    let gameManager = GameManager()
    private var sumViewItemCount = 0
    private var arrayEndRange = 0
    private var arrayStartRange = 0
    private var numArray = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib1 = UINib(nibName: "SumCollectionViewCell", bundle: nil)
        sumCollectionView.register(nib1, forCellWithReuseIdentifier: "SumCell")
        
        let nib2 = UINib(nibName: "NumberCollectionViewCell", bundle: nil)
        numCollectionView.register(nib2, forCellWithReuseIdentifier: "NumCell")
        
        DBManager.shared.loadData(fileName: "Data") { data in
         if let data = data {
            if let (targetNumber, count, sumArray) = self.gameManager.getValues(from: data) {
            self.targetNumLabel.text = "\(targetNumber)"
            self.countNumLabel.text = "\(count)"
            self.arrayEndRange = targetNumber
            self.arrayStartRange = targetNumber/count
            self.sumViewItemCount = count
           }
        }
    }
        
    let randomValues = gameManager.generateRandomValues(Arraycount: 24, range: arrayStartRange..<arrayEndRange)
        numArray = gameManager.numberArray
        numArray.shuffle()
        
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

     
}
extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sumCollectionView {
            return sumViewItemCount
        } else {
            return 24
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sumCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SumCell", for: indexPath) as? SumCollectionViewCell else { return UICollectionViewCell()}
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumCell", for: indexPath) as? NumberCollectionViewCell else { return UICollectionViewCell()}
            cell.numLabel.text = String(numArray[indexPath.item])
            return cell
        }
    }
    
    
}
extension GameViewController: UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        let cellWidth = ( screenWidth - 35 ) / 4
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    
}
