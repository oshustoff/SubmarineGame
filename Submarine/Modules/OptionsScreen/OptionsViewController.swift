//
//  OptionsViewController.swift
//  Submarine
//
//  Created by Olga Shustova on 11.12.2024.
//

import UIKit

class OptionsViewController: UIViewController {
    
    // MARK: - IBOUtlets
    @IBOutlet weak var makeChoiceButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    // MARK: - Methods
    
    func setupOutlets() {
        self.makeChoiceButton.layer.masksToBounds = false
        self.makeChoiceButton.layer.cornerRadius = 10
        self.makeChoiceButton.layer.shadowColor = UIColor.darkGray.cgColor
        self.makeChoiceButton.layer.shadowRadius = 10
        self.makeChoiceButton.layer.shadowOffset = CGSize(width: 25, height: 15)
        self.makeChoiceButton.layer.shadowPath = UIBezierPath(rect: self.makeChoiceButton.bounds).cgPath
        self.nameTextField.layer.shadowColor = UIColor.black.cgColor
        self.nameTextField.layer.shadowOffset = CGSize(width: 25, height: 15)
        self.nameTextField.layer.shadowRadius = self.nameTextField.layer.cornerRadius
    }
    
    @IBAction func chooseButtonTap(_ sender: UIButton) {
        let chooseSubmarine = ChooseSubmarineViewController()
        self.navigationController?.pushViewController(chooseSubmarine, animated: true)
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
}
