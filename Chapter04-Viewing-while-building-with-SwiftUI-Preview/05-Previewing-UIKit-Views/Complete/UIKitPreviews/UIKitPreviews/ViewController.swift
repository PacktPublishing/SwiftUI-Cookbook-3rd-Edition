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

#Preview {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateInitialViewController()!
    return vc
}

#Preview("UILabel") {
    let label = UILabel()
    label.text = "Previewing a UILabel"
    label.font = UIFont.preferredFont(forTextStyle: .title3)
    return label
}
