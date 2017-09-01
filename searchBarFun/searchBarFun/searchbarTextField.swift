//
//  searchbarTextField.swift
//  searchBarFun
//
//  Created by Landon Vago-Hughes on 31/08/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.


import Foundation
import UIKit
import Darwin

class SetupTextField {
    
    weak var backgroundView = UIView()
    weak var searched = UIButton()
    weak var view = UIView()
    weak var searchBarView = UIView()
    weak var searchlabel = UITextField()
    weak var cancelButton = UIButton()
    
    struct buttons {
        var dismiss: UIButton
        var search: UIButton
    }
    
    func viewDidLoadSearchButton(viewer: UIView) -> buttons {
        let backgroundView = UIView()
        self.view = viewer
        self.backgroundView = backgroundView
        viewer.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 35
        backgroundView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        backgroundView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: -150).isActive = true
        backgroundView.layer.opacity = 0.0
        
        let searchBarView = UIView()
        self.searchBarView = searchBarView
        viewer.addSubview(searchBarView)
        searchBarView.layer.cornerRadius = 30
        searchBarView.layer.opacity = 1.0
        searchBarView.layer.backgroundColor = UIColor(red: 230/255, green: 228/255, blue: 228/255, alpha: 1.0).cgColor
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        searchBarView.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: -150).isActive = true
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
        searched.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: -150).isActive = true
        searched.centerXAnchor.constraint(equalTo: viewer.centerXAnchor).isActive = true
        
        let searchLabel = UITextField()
        viewer.addSubview(searchLabel)
        self.searchlabel = searchLabel
        searchLabel.attributedPlaceholder = NSAttributedString(string: "Search for friends ...", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        searchLabel.font = UIFont(name: "Avenir-Heavy", size: 15.0)
        searchLabel.textColor = UIColor.lightGray
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.textAlignment = .center
        searchLabel.centerXAnchor.constraint(equalTo: viewer.centerXAnchor, constant: 0).isActive = true
        searchLabel.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: -130).isActive = true
        searchLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        searchLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchLabel.layer.opacity = 0
        
        let cancelButton = UIButton()
        viewer.addSubview(cancelButton)
        self.cancelButton = cancelButton
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setImage(UIImage(named: "cancel"), for: .normal)
        cancelButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelButton.layer.opacity = 0
        cancelButton.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: -150).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: viewer.centerXAnchor, constant: 120).isActive = true
        
        return buttons(dismiss: cancelButton, search: searched)
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
            self.searchlabel?.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: -150).isActive = true
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                viewer.layoutIfNeeded()
                self.cancelButton?.transform = CGAffineTransform(rotationAngle: CGFloat(300))
                self.cancelButton?.layer.opacity = 1
                self.searchlabel?.layer.opacity = 1.0
            })
        })
    }
    
    func dismissAnimation(viewer: UIView) {
        viewer.layoutIfNeeded()
        self.backgroundView?.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            viewer.layoutIfNeeded()
            self.backgroundView?.layer.opacity = 0
            self.searchBarView?.layer.opacity = 1
            self.cancelButton?.transform = CGAffineTransform(rotationAngle: CGFloat(0))
            self.cancelButton?.layer.opacity = 0
        }, completion: { finished in
            
            viewer.layoutIfNeeded()
            self.searchlabel?.centerYAnchor.constraint(equalTo: viewer.centerYAnchor, constant: -130).isActive = true
//            self.searchBarView?.centerXAnchor.constraint(equalTo: viewer.centerXAnchor, constant: 1).isActive = true
//            self.searched?.centerXAnchor.constraint(equalTo: viewer.centerXAnchor, constant: 1).isActive = true
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                viewer.layoutIfNeeded()
                self.searchBarView?.layer.frame = CGRect(x: (self.view?.layer.frame.width)!/2, y: ((self.view?.layer.frame.width)!/2)-20, width: 63, height: 63)
                self.searched?.layer.frame = CGRect(x: (self.view?.layer.frame.width)!/2, y: ((self.view?.layer.frame.width)!/2)-20, width: 25, height: 25)
//                self.searchlabel?.frame.origin.x += 5
                self.searchlabel?.layer.opacity = 0
            })
        })
    }
    
    
    
}
