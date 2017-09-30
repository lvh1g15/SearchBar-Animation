//
//  ViewController.swift
//  searchBarFun
//
//  Created by Landon Vago-Hughes on 31/08/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var searchClass = SetupTextField()
    var textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        let searchStruct = searchClass.viewDidLoadSearchButton(viewer: self.view)
        searchStruct.search.addTarget(self, action: #selector(animate(_:)), for: .touchUpInside)
        searchStruct.dismiss.addTarget(self, action: #selector(dismissAnimate(_:)), for: .touchUpInside)
        self.textField = searchStruct.searchLabel
        self.textField.delegate = self
    }
    
    @objc private func animate(_ sender: UIButton) {
        searchClass.setupBackgroundView(viewer: self.view)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchClass.backgroundAnimate(view: self.view, openOrClose: true)
    }
    
    @objc private func dismissAnimate(_ sender: UIButton) {
        searchClass.dismissAnimation(viewer: self.view)
    }
    
    private func dismissKeyboard() {
        let swipeDownGesture: [UISwipeGestureRecognizerDirection] = [.down]
        if swipeDownGesture[0] == .down {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            gesture.direction = swipeDownGesture[0]
            self.view.addGestureRecognizer(gesture)
        }
    }
    
    @objc private func handleSwipe(sender: UISwipeGestureRecognizer) {
        searchClass.backgroundAnimate(view: self.view, openOrClose: false)
        view.endEditing(true)
    }
}

