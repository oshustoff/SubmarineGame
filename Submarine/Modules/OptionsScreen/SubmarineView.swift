//
//  SubmarineView.swift
//  Submarine
//
//  Created by Olga Shustova on 05.02.2025.
//

import UIKit

class SubmarineView: UIView {

    var imageView: UIImageView
    
    init(image: UIImage) {
        self.imageView = UIImageView(image: image)
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 10, height: 10)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
