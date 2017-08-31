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
    
    struct ToMainViewController {
        var background: UIView
        var searchView: UIView
        var searchButton: UIButton
    }
    
    func viewDidLoadSearchButton(viewer: UIView) -> UIButton {
        let backgroundView = UIView()
        self.view = viewer
        self.backgroundView = backgroundView
        viewer.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 40
        backgroundView.layer.backgroundColor = UIColor.black.cgColor
        backgroundView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: 0).isActive = true
        backgroundView.layer.opacity = 0.0
        
        let searchBarView = UIView()
        self.searchBarView = searchBarView
        viewer.addSubview(searchBarView)
        searchBarView.layer.cornerRadius = 35
        searchBarView.layer.opacity = 1.0
        searchBarView.layer.backgroundColor = UIColor(red: 230/255, green: 228/255, blue: 228/255, alpha: 1.0).cgColor
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        searchBarView.centerYAnchor.constraint(equalTo: viewer.centerYAnchor).isActive = true
        searchBarView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        let searched = UIButton()
        self.searched = searched
        searchBarView.addSubview(searched)
        searched.layer.cornerRadius = 30
        searched.setImage(UIImage(named: "search"), for: .normal)
        searched.translatesAutoresizingMaskIntoConstraints = false
        searched.widthAnchor.constraint(equalToConstant: 25).isActive = true
        searched.heightAnchor.constraint(equalToConstant: 25).isActive = true
        searched.centerYAnchor.constraint(equalTo: searchBarView.centerYAnchor).isActive = true
        searched.centerXAnchor.constraint(equalTo: searchBarView.centerXAnchor).isActive = true
        
        return searched
    }
    
    func setupBackgroundView(viewer: UIView) {
        
        viewer.layoutIfNeeded()
        self.backgroundView?.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            viewer.layoutIfNeeded()
            self.backgroundView?.layer.opacity = 1.0
            
        })
    }
}
