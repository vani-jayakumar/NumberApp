//
//  HomeViewController.swift
//  NumberApp
//
//  Created by Vani on 8/29/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func didTapPlay(button: UIButton) {
        let levelVC = LevelViewController(nibName: "LevelViewController", bundle: nil)
        self.navigationController?.pushViewController(levelVC , animated: true)
    }
}
