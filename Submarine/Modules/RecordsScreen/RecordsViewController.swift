//
//  RecordsViewController.swift
//  Submarine
//
//  Created by Michael Shustov on 11.12.2024.
//

import UIKit

class RecordsViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Methods
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
}
