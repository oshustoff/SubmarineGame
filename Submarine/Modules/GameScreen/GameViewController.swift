//
//  GameViewController.swift
//  Submarine
//
//  Created by Olga Shustova on 11.12.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var oxygenLevelView: UIView!
    @IBOutlet weak var submarineImage: UIImageView!
    @IBOutlet weak var changedOxygenView: UIView!
    @IBOutlet weak var changedOxygenLevelViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var oxygenLevelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var submarineTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var gameScreenImage: UIImageView!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var shootButton: UIButton!
    @IBOutlet weak var shootLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Properties
    var completion: () -> Void = {}
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubmarineImage()
        setupOxygenLevelView()
        setupInfoLabel()
        movingObjects()
    }
    
    // MARK: - Methods
    func setupOxygenLevelView() {
        self.changedOxygenView.translatesAutoresizingMaskIntoConstraints = false
        self.oxygenLevelView.layer.cornerRadius = 10
        self.oxygenLevelView.layer.borderWidth = 2
        self.changedOxygenView.layer.cornerRadius = 10
        self.changedOxygenView.alpha = 0.8
    }
    
    func setupSubmarineImage() {
        let model = UserDefaults.standard.value(OptionsData.self, forKey: "options")
        if let model = model {
            submarineImage.image = UIImage(named: model.chosenSubmarine)
        } else {
            submarineImage.image = UIImage(named: "submarineOne")
        }
        submarineImage.contentMode = .scaleAspectFit
        shootButton.clipsToBounds = true
        shootButton.contentMode = .scaleAspectFill
        shootButton.setBackgroundImage(UIImage(named: "fire"), for: .normal)
        shootButton.isHidden = true
        shootLabel.isHidden = true
    }
    
    func setupInfoLabel() {
        let optionsModel = UserDefaults.standard.value(OptionsData.self, forKey: "options")
        self.infoLabel.text = "\(optionsModel?.gamerName ?? "Gamer")"
        
    }
    
    @IBAction func upButtonTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.submarineTopConstraint.constant -= 35
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func downButtonTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.submarineTopConstraint.constant += 35
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func shootButtonTap(_ sender: UIButton) {
        let torpeda = UIImageView()
        torpeda.frame = CGRect(x: self.submarineImage.frame.origin.x + self.submarineImage.frame.width, y: self.submarineImage.frame.origin.y + self.submarineImage.frame.height / 2, width: 100, height: 50)
        torpeda.image = UIImage(named: "torpeda")
        self.view.addSubview(torpeda)
        
        var count = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            count += 1
            UIView.animate(withDuration: 1/60) {
                torpeda.frame.origin.x += 1
            }
        }
        timer.fire()
        
        guard let currentStringValue = self.shootLabel.text,
              var currentValue = Int(currentStringValue) else { return }
        currentValue -= 1
        self.shootLabel.text = String(currentValue)
        
        if count == 200 {
            timer.invalidate()
        }
    }
    
    
}
