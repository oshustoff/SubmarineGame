//
//  ChooseSubmarineViewController.swift
//  Submarine
//
//  Created by Michael Shustov on 05.02.2025.
//

import UIKit

class ChooseSubmarineViewController: UIViewController {
    
    // MARK: - Properties
    var backgroundView: UIImageView?
    var firstImage: UIView?
    var secondImage: UIView?
    var thirdImage: UIView?
    var nameImage: String?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
//        addRecognizer()
    }
    
   // MARK: - Methods
    func setupImages() {
        let screenPicture = UIImageView()
        screenPicture.image = UIImage(named: "gameScreenBackground")
        screenPicture.alpha = 0.6
        screenPicture.translatesAutoresizingMaskIntoConstraints = false
        backgroundView = screenPicture
        self.view.addSubview(backgroundView!)
        NSLayoutConstraint.activate([screenPicture.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     screenPicture.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     screenPicture.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     screenPicture.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        guard let image = UIImage(named: "submarineOne") else { return }
        firstImage = SubmarineView(image: image)
        guard let firstImage = self.firstImage else { return }
        self.view.addSubview(firstImage)
        NSLayoutConstraint.activate([firstImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
                                     firstImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
                                     firstImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2),
                                     firstImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3.5),
                                    ])
        
        guard let image = UIImage(named: "submarineTwo") else { return }
        secondImage = SubmarineView(image: image)
        guard let secondImage = self.secondImage else { return }
        self.view.addSubview(secondImage)
        NSLayoutConstraint.activate([secondImage.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 20),
                                     secondImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
                                     secondImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2),
                                     secondImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3.5)])
        
        guard let image = UIImage(named: "submarineThree") else { return }
        thirdImage = SubmarineView(image: image)
        guard let thirdImage = self.thirdImage else { return }
        self.view.addSubview(thirdImage)
        NSLayoutConstraint.activate([thirdImage.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: 20),
                                     thirdImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
                                     thirdImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2),
                                     thirdImage.widthAnchor.constraint(equalTo: firstImage.widthAnchor)])
    }
    
//    func addRecognizer() {
//        let tap = UIGestureRecognizer(target: self, action: #selector(makeChoice))
//        firstImage?.addGestureRecognizer(tap)
//        secondImage?.addGestureRecognizer(tap)
//        thirdImage?.addGestureRecognizer(tap)
//    }
//    
//    @objc func makeChoice(sender: UITapGestureRecognizer) {
//        let chooseOne = sender.location(in: firstImage)
//        let chooseTwo = sender.location(in: secondImage)
//        let chooseThree = sender.location(in: thirdImage)
//
//    }
}
