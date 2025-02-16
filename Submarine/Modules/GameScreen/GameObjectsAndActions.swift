//
//  GameObjectsAndActions.swift
//  Submarine
//
//  Created by Michael Shustov on 14.02.2025.
//

import UIKit

extension GameViewController {
    
    func movingObjects() {
        let fishOne = UIImageView()
        fishOne.frame = CGRect(x: self.view.frame.maxX, y: 250, width: 70, height: 45)
        fishOne.image = UIImage(named: "fishOne")
        self.view.addSubview(fishOne)
        
        let fishTwo = UIImageView()
        fishTwo.frame = CGRect(x: self.view.frame.maxX, y: 130, width: 65, height: 40)
        fishTwo.image = UIImage(named: "fishTwo")
        self.view.addSubview(fishTwo)
        
        let fishThree = UIImageView()
        fishThree.frame = CGRect(x: self.view.frame.maxX, y: 190, width: 50, height: 50)
        fishThree.image = UIImage(named: "fishThree")
        self.view.addSubview(fishThree)
        
        let myBoat = UIImageView()
        myBoat.frame = CGRect(x: self.view.frame.maxX, y: 20, width: 120, height: 55)
        myBoat.image = UIImage(named: "shipTwo")
        self.view.addSubview(myBoat)
        
        let myShip = UIImageView()
        myShip.frame = CGRect(x: -150, y: 0, width: 120, height: 45)
        myShip.image = UIImage(named: "shipOne")
        self.view.addSubview(myShip)
        
        let rockOne = UIImageView()
        rockOne.frame = CGRect(x: self.view.frame.maxX, y: 310, width: 70, height: 130)
        rockOne.image = UIImage(named: "rockOne")
        self.view.addSubview(rockOne)
        
        let greens = UIImageView()
        greens.frame = CGRect(x: self.view.frame.maxX + 70, y: 310, width: 70, height: 130)
        greens.image = UIImage(named: "greens")
        self.view.addSubview(greens)
        
        let rockTwo = UIImageView()
        rockTwo.frame = CGRect(x: self.view.frame.maxX + 140, y: 325, width: 50, height: 125)
        rockTwo.image = UIImage(named: "rockTwo")
        self.view.addSubview(rockTwo)
        
        let bigRock = UIImageView()
        bigRock.frame = CGRect(x: self.view.frame.maxX + 190, y: 310, width: 90, height: 150)
        bigRock.image = UIImage(named: "bigRock")
        bigRock.contentMode = .scaleAspectFill
        self.view.addSubview(bigRock)
        
        let rockGreen = UIImageView()
        rockGreen.frame = CGRect(x: self.view.frame.maxX + 290, y: 290, width: 75, height: 150)
        rockGreen.image = UIImage(named: "rockGreen")
        self.view.addSubview(rockGreen)
        
        let coin = UIImageView()
        coin.frame = CGRect(x: self.view.frame.maxX + 290, y: 110, width: 35, height: 35)
        coin.image = UIImage(named: "coin")
        self.view.addSubview(coin)
        
        let health = UIImageView()
        health.frame = CGRect(x: self.view.frame.maxX + 290, y: 160, width: 35, height: 40)
        health.image = UIImage(named: "health")
        self.view.addSubview(health)
        
        let torpedasBox = UIImageView()
        torpedasBox.frame = CGRect(x: self.view.frame.maxX + 360, y: 200, width: 70, height: 50)
        torpedasBox.image = UIImage(named: "box")
        self.view.addSubview(torpedasBox)
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            fishOne.frame.origin.x = 0
        } completion: { _ in
            
        }
        
        var score = 0
        var count = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            count += 1
            //            UIView.animate(withDuration: 1/60, delay: 2, options: .transitionCurlUp) {
            //                fishOne.frame.origin.x -= 1
            ////                fishOne.layer.presentation()
            //                fishTwo.frame.origin.x -= 0.8
            //            }
            //            fishOne.frame.origin.x -= 1
            //            fishTwo.frame.origin.x -= 0.8
            fishThree.frame.origin.x -= .random(in: 0.5...0.7)
            myBoat.frame.origin.x -= 1.6
            myShip.frame.origin.x += 1.2
            rockOne.frame.origin.x -= 0.9
            greens.frame.origin.x -= 0.9
            rockTwo.frame.origin.x -= 0.6
            bigRock.frame.origin.x -= 0.5
            rockGreen.frame.origin.x -= .random(in: 0...0.7)
            coin.frame.origin.x -= 1.2
            health.frame.origin.x -= 1.4
            torpedasBox.frame.origin.x -= 2
            
            self.submarineImage.layoutIfNeeded()
            if self.submarineImage.frame.intersects(fishOne.frame) ||
                self.submarineImage.frame.intersects(fishTwo.frame) ||
                self.submarineImage.frame.intersects(fishThree.frame) ||
                self.submarineImage.frame.intersects(myBoat.frame) ||
                self.submarineImage.frame.intersects(myShip.frame) ||
                self.submarineImage.frame.intersects(rockOne.frame) ||
                self.submarineImage.frame.intersects(greens.frame) ||
                self.submarineImage.frame.intersects(rockTwo.frame) ||
                self.submarineImage.frame.intersects(bigRock.frame) ||
                self.submarineImage.frame.intersects(rockGreen.frame)
            {
                timer.invalidate()
                self.submarineImage.image = UIImage(named: "boom")
                //                fishOne.isHidden = true
                //                fishTwo.isHidden = true
                //                fishThree.isHidden = true
                //                rockOne.isHidden = true
                //                rockTwo.isHidden = true
                //                bigRock.isHidden = true
                //                rockGreen.isHidden = true
                //                greens.isHidden = true
                //                myBoat.isHidden = true
                //                myShip.isHidden = true
                //                coin.isHidden = true
                //                health.isHidden = true
                //                self.upButton.isHidden = true
                //                self.downButton.isHidden = true
                //                self.oxygenLevelView.isHidden = true
                
                
                guard let gameOverController = UIStoryboard(name: "GameScreen", bundle: nil).instantiateViewController(identifier: "GameOverViewController") as? GameOverViewController else { return }
                gameOverController.completion = {
                    self.navigationController?.popToRootViewController(animated: false)
                }
                self.present(gameOverController, animated: true)
                
            }
            
            if self.submarineImage.frame.intersects(coin.frame) {
                coin.removeFromSuperview()
            }
            
            if self.submarineImage.frame.intersects(torpedasBox.frame) {
                torpedasBox.removeFromSuperview()
                self.shootButton.isHidden = false
                self.shootLabel.isHidden = false
            }
            
            if self.submarineImage.frame.intersects(health.frame) {
                health.removeFromSuperview()
//                if self.changedOxygenLevelViewTopConstraint. < self.oxygenLevelView.topAnchor {
//                    self.changedOxygenView.frame.size = CGSize(width: self.changedOxygenView.frame.width, height: self.changedOxygenView.frame.height - 25)
                }
                
                
                
                if count == 500
                {
//                    self.changedOxygenLevelViewTopConstraint = NSLayoutConstraint(item: self.changedOxygenLevelViewTopConstraint, attribute: .top, relatedBy: .equal, toItem: self.oxygenLevelTopConstraint, attribute: .top, multiplier: 0.8, constant: 0)
                }
            }
            
            timer.fire()
            
        }
    }

