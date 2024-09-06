//
//  LevelViewController.swift
//  NumberApp
//
//  Created by Vani on 9/3/24.
//

import UIKit

class LevelViewController: UIViewController {
    
    @IBOutlet weak var firstLevelButton: UIButton!
    @IBOutlet weak var secondLevelButton: UIButton!
    @IBOutlet weak var thirdLevelButton: UIButton!
    @IBOutlet weak var fourthLevelButton: UIButton!
    
    var levelValue: String = ""
    var unlockedLevel: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLevelButtons()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction private func didTapFirstLevel(button: UIButton){
        levelValue = "two"
        navigateToGameVc()
    }
    @IBAction private func didTapSecondLevel(button: UIButton){
        levelValue = "three"
        navigateToGameVc()
    }
    @IBAction private func didTapThirdLevel(button: UIButton){
        levelValue = "four"
        navigateToGameVc()
    }
    @IBAction private func didTapFourthLevel(button: UIButton){
        levelValue = "five"
        navigateToGameVc()
    }
    
    private func navigateToGameVc() {
        let gameVC = GameViewController(nibName: "GameViewController", bundle: nil)
        gameVC.gameViewModel.levelCount = levelValue
       
        gameVC.levelCompletionHandler = { [weak self] in
            self?.unlockNextLevel()
                }
        
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    private func unlockNextLevel() {
        if unlockedLevel < 4 {
           unlockedLevel += 1
           updateLevelButtons()
        }
    }
    private func updateLevelButtons() {
            firstLevelButton.isEnabled = unlockedLevel >= 1
            secondLevelButton.isEnabled = unlockedLevel >= 2
            thirdLevelButton.isEnabled = unlockedLevel >= 3
            fourthLevelButton.isEnabled = unlockedLevel >= 4
    
            firstLevelButton.backgroundColor = firstLevelButton.isEnabled ? .white : .lightGray
            secondLevelButton.backgroundColor = secondLevelButton.isEnabled ? .white : .lightGray
            thirdLevelButton.backgroundColor = thirdLevelButton.isEnabled ? .white : .lightGray
            fourthLevelButton.backgroundColor = fourthLevelButton.isEnabled ? .white : .lightGray
        }
}
