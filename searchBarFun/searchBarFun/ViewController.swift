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
        searchClass.viewDidLoadSearchButton(viewer: self.view)
    }
}

