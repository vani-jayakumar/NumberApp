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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction private func didTapPlay(button: UIButton) {
        let GameVC = GameViewController(nibName: "GameViewController", bundle: nil)
        self.navigationController?.pushViewController(GameVC , animated: true)
    }
}
