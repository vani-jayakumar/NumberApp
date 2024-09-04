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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
