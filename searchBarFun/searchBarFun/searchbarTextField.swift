//
//  searchbarTextField.swift
//  searchBarFun
//
//  Created by Landon Vago-Hughes on 31/08/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.


import Foundation
import UIKit

class SetupTextField {
    weak var backgroundView = UIView()
    weak var searched = UIButton()
    weak var view = UIView()
    weak var searchBarView = UIView()
    
    func viewDidLoadSearchButton(viewer: UIView) {
        let backgroundView = UIView()
        self.view = viewer
        self.backgroundView = backgroundView
        viewer.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
//        backgroundView.layer.opacity = 0
        
        backgroundView.layer.cornerRadius = 50
        backgroundView.heightAnchor.constraint(equalToConstant: 95).isActive = true
        backgroundView.widthAnchor.constraint(equalToConstant: 95).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: 0).isActive = true
        backgroundView.layer.backgroundColor = UIColor.clear.cgColor
        
        let searchBarView = UIView()
        self.searchBarView = searchBarView
        backgroundView.addSubview(searchBarView)
        searchBarView.layer.cornerRadius = 40
        searchBarView.layer.opacity = 1.0
        searchBarView.layer.backgroundColor = UIColor.lightGray.cgColor
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        searchBarView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        searchBarView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let searched = UIButton()
        self.searched = searched
        searchBarView.addSubview(searched)
        searched.layer.cornerRadius = 30
        searched.setImage(UIImage(named: "search"), for: .normal)
        searched.translatesAutoresizingMaskIntoConstraints = false
        searched.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searched.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searched.centerYAnchor.constraint(equalTo: searchBarView.centerYAnchor).isActive = true
        searched.centerXAnchor.constraint(equalTo: searchBarView.centerXAnchor).isActive = true
        
    }
    
    func animateSearchBar() {
        view?.layoutIfNeeded()
        backgroundView?.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view?.layoutIfNeeded()
            self.backgroundView?.layer.opacity = 1.0
            self.searched?.layer.backgroundColor = UIColor.clear.cgColor

        }, completion: nil)
    }
}
