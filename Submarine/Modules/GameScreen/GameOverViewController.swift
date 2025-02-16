//
//  GameOverViewController.swift
//  Submarine
//
//  Created by Olga Shustova on 12.02.2025.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var completion: () -> Void = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoLabel.text = "GAME OVER"
    }
    
    
    
    @IBAction func tryAgainButtonTap(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
    @IBAction func menuButtonTap(_ sender: UIButton) {
        self.dismiss(animated: false, completion: completion)
    }
}
