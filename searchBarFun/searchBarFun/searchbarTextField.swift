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
    weak var searchlabel = UITextField()
    
    func viewDidLoadSearchButton(viewer: UIView) -> UIButton {
        let backgroundView = UIView()
        self.view = viewer
        self.backgroundView = backgroundView
        viewer.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 35
        backgroundView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        backgroundView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: 0).isActive = true
        backgroundView.layer.opacity = 0.0
        
        let searchBarView = UIView()
        self.searchBarView = searchBarView
        viewer.addSubview(searchBarView)
        searchBarView.layer.cornerRadius = 30
        searchBarView.layer.opacity = 1.0
        searchBarView.layer.backgroundColor = UIColor(red: 230/255, green: 228/255, blue: 228/255, alpha: 1.0).cgColor
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        searchBarView.centerYAnchor.constraint(equalTo: viewer.centerYAnchor).isActive = true
        searchBarView.widthAnchor.constraint(equalToConstant: 63).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 63).isActive = true
        
        let searched = UIButton()
        self.searched = searched
        viewer.addSubview(searched)
        searched.layer.cornerRadius = 30
        searched.setImage(UIImage(named: "search"), for: .normal)
        searched.translatesAutoresizingMaskIntoConstraints = false
        searched.widthAnchor.constraint(equalToConstant: 25).isActive = true
        searched.heightAnchor.constraint(equalToConstant: 25).isActive = true
        searched.centerYAnchor.constraint(equalTo: viewer.centerYAnchor).isActive = true
        searched.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        
        let searchLabel = UITextField()
        viewer.addSubview(searchLabel)
        self.searchlabel = searchLabel
        searchLabel.attributedPlaceholder = NSAttributedString(string: "Search for your friends ...", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        searchLabel.font = UIFont(name: "Avenir-Medium", size: 15.0)
        searchLabel.textColor = UIColor.lightGray
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.textAlignment = .center
        searchLabel.centerXAnchor.constraint(equalTo: viewer.centerXAnchor, constant: 0).isActive = true
        searchLabel.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: 20).isActive = true
        searchLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        searchLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchLabel.layer.opacity = 0
        
        return searched
    }
    
    func setupBackgroundView(viewer: UIView) {
        
        viewer.layoutIfNeeded()
        self.backgroundView?.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.searchBarView?.centerXAnchor.constraint(equalTo: viewer.centerXAnchor, constant: -105).isActive = true
        self.searched?.centerXAnchor.constraint(equalTo: viewer.centerXAnchor, constant: -110).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            viewer.layoutIfNeeded()
            self.backgroundView?.layer.opacity = 1
            self.searchBarView?.layer.opacity = 0
        }, completion: { finished in
            
            viewer.layoutIfNeeded()
            self.searchlabel?.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: 0).isActive = true
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                viewer.layoutIfNeeded()
                self.searchlabel?.layer.opacity = 1.0
            })
        })
    }
}
