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

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib1 = UINib(nibName: "SumCollectionViewCell", bundle: nil)
        sumCollectionView.register(nib1, forCellWithReuseIdentifier: "SumCell")
        
        let nib2 = UINib(nibName: "NumberCollectionViewCell", bundle: nil)
        numCollectionView.register(nib2, forCellWithReuseIdentifier: "NumCell")
        // Do any additional setup after loading the view.
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
            return 5
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
            return cell
        }
    }
    
    
}
