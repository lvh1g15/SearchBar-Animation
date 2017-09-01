//
//  ViewController.swift
//  searchBarFun
//
//  Created by Landon Vago-Hughes on 31/08/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var searchClass = SetupTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchStruct = searchClass.viewDidLoadSearchButton(viewer: self.view)
        searchStruct.search.addTarget(self, action: #selector(animate(_:)), for: .touchUpInside)
        searchStruct.dismiss.addTarget(self, action: #selector(dismissAnimate(_:)), for: .touchUpInside)
    }
    
    @objc private func animate(_ sender: UIButton) {
        searchClass.setupBackgroundView(viewer: self.view)
    }
    
    @objc private func dismissAnimate(_ sender: UIButton) {
        searchClass.dismissAnimation(viewer: self.view)
    }
}

