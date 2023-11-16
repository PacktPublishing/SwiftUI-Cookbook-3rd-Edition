//
//  ViewController.swift
//  UIKitPreviews
//
//  Created by Juan Catalan on 6/28/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let title { print(title) }
    }
}
