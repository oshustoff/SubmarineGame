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
    @IBOutlet weak var soundLevel: UISlider!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var volumeLabel: UILabel!
    
    // MARK: - Properties
    let model = OptionsData(gamerName: "", chosenSubmarine: "", volume: 0)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
        model.getUDData()
    }
    
    // MARK: - Methods
    
    func setupOutlets() {
        self.makeChoiceButton.layer.cornerRadius = 10
        self.makeChoiceButton.layer.shadowColor = UIColor.white.cgColor
        self.makeChoiceButton.layer.shadowRadius = 10
        self.makeChoiceButton.layer.shadowOpacity = 0.9
        self.makeChoiceButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.layer.shadowColor = UIColor.white.cgColor
        self.saveButton.layer.shadowRadius = 10
        self.saveButton.layer.shadowOpacity = 0.9
        self.saveButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.soundLevel.layer.cornerRadius = 10
        self.soundLevel.layer.shadowColor = UIColor.white.cgColor
        self.soundLevel.layer.shadowRadius = 10
        self.soundLevel.layer.shadowOpacity = 0.9
        self.soundLevel.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.nameTextField.layer.shadowColor = UIColor.darkGray.cgColor
        self.nameTextField.layer.shadowOpacity = 0.9
        self.nameTextField.layer.shadowRadius = 10
        self.nameTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    @IBAction func chooseButtonTap(_ sender: UIButton) {
        let chooseSubmarine = ChooseSubmarineViewController()
        chooseSubmarine.chooseHandler = { submarineName in
            self.model.chosenSubmarine = submarineName
            self.model.saveUDData()
        }
        self.navigationController?.pushViewController(chooseSubmarine, animated: true)
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonTap(_ sender: UIButton) {
        model.gamerName = nameTextField.text ?? ""
        model.saveUDData()
    }
}
