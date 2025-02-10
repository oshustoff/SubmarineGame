//
//  OptionsViewController.swift
//  Submarine
//
//  Created by Olga Shustova on 11.12.2024.
//

import UIKit

class OptionsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var backButton: UIButton!
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    @IBAction func chooseButtonTap(_ sender: UIButton) {
        let chooseSubmarine = ChooseSubmarineViewController()
        self.navigationController?.pushViewController(chooseSubmarine, animated: true)
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
}
