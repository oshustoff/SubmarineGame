//
//  ViewController.swift
//  Submarine
//
//  Created by Michael Shustov on 11.12.2024.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainPicture()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Methods
    func setupMainPicture() {
        let mainPicture = UIImageView()
        mainPicture.image = UIImage(named: "logo")
        mainPicture.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainPicture)
        NSLayoutConstraint.activate([
            mainPicture.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 250),
            mainPicture.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            mainPicture.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 50),
            mainPicture.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 50)])
    }
    
    @IBAction func gameButtonTap(_ sender: UIButton) {
        let sb = UIStoryboard(name: "GameScreen", bundle: nil)
        let gameVC = sb.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameVC.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @IBAction func recordButtonTap(_ sender: UIButton) {
        let sb = UIStoryboard(name: "RecordsScreen", bundle: nil)
        let recordsVC = sb.instantiateViewController(withIdentifier: "RecordsViewController") as! RecordsViewController
        recordsVC.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(recordsVC, animated: true)
        
    }
    
    @IBAction func optionsButtonTap(_ sender: UIButton) {
        let sb = UIStoryboard(name: "OptionsScreen", bundle: nil)
        let optionsVC = sb.instantiateViewController(withIdentifier: "OptionsViewController") as! OptionsViewController
        optionsVC.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(optionsVC, animated: true)
    }
    
}

