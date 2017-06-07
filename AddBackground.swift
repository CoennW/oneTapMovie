//
//  AddBackground.swift
//  oneTapMovie
//
//  Created by Fhict on 06/06/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addBackground(imageName: String = "bg_one_tap_movie_lines@1x.png", contextMode: UIViewContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        sendSubview(toBack: backgroundImageView)
        
        // adding NSLayoutConstraints
        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}

extension UITextField {
    func setBottomBorder() {
        
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.textAlignment = .center
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.0
        self.layer.shadowRadius = 0.0
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.lightGray
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.lightGray.withAlphaComponent(0.2)])
    }
    
    
    func bottomBorder(textField: UITextField){
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 25, width: textField.frame.size.width , height: 0.5)
        topBorder.backgroundColor = UIColor.gray.cgColor
        textField.layer.addSublayer(topBorder)
    }
}

extension String {
    func getApiKey() -> String {
        let apiKey = "279e6330590f5e8788be345bf87321ca"
        return apiKey
    }
}


