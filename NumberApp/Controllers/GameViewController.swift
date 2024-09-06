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
    @IBOutlet weak var numCollectionView: UICollectionView!
    @IBOutlet weak var sumLabel: UILabel!
    
    var gameViewModel = GameViewModel()
    var levelCompletionHandler: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib2 = UINib(nibName: "NumberCollectionViewCell", bundle: nil)
        numCollectionView.register(nib2, forCellWithReuseIdentifier: "NumCell")
        
        gameViewModel.delegate = self
        gameViewModel.fetchDetails()
        
        targetNumLabel.text = gameViewModel.targetnumLabel
        countNumLabel.text = gameViewModel.countnumLabel
        sumLabel.text = ""
   }
}
    
extension GameViewController: GameViewModelDelegate {
    
    
    func didUpdateTargetNum(_ targetNum: String) {
        targetNumLabel.text = targetNum
    }
    
    func didUpdateCountNum(_ countNum: String) {
        countNumLabel.text = countNum
    }
    
    func didUpdateSumValues(_ sumText: String) {
        sumLabel.text = sumText
    }
    
    func didUpdateResult(_ result: Bool) {
        if gameViewModel.sumValues.count == gameViewModel.sumViewItemCount {
        if result {
            let successAlert = UIAlertController(title: "Congratulations!", message:"Completed the level" , preferredStyle: .alert)
            let playAgainAction = UIAlertAction(title: "Play Again", style: .default) {_ in
                self.levelCompletionHandler?() 
            self.navigationController?.popViewController(animated: true)
            }
            successAlert.addAction(playAgainAction)
            self.present(successAlert, animated: true, completion: nil)

        } else {
            let failAlert = UIAlertController(title: "Oops!", message:"You are almost there" , preferredStyle: .alert)
            let tryAgainAction = UIAlertAction(title: "Try Again", style: .default) {_ in
            self.navigationController?.popViewController(animated: true)
            }
            failAlert.addAction(tryAgainAction)
            self.present(failAlert, animated: true, completion: nil)

        }
        }
    }
    
        
    }
extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumCell", for: indexPath) as? NumberCollectionViewCell else { return UICollectionViewCell()}
            cell.numLabel.text = String(gameViewModel.numArray[indexPath.item])
          return cell
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if gameViewModel.sumValues.count < gameViewModel.sumViewItemCount{
        cell?.layer.borderWidth = 2.0
        cell?.layer.borderColor = UIColor.green.cgColor
        }
        gameViewModel.getSumValues(index: indexPath.item)
        if gameViewModel.sumValues.count == gameViewModel.sumViewItemCount {
           gameViewModel.result()
        }
    }
}

