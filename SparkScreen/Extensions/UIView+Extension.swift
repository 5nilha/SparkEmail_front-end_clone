//
//  UIView+Extension.swift
//  SparkScreen
//
//  Created by Fabio Quintanilha on 11/28/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

extension UIView {
    
    func circle() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func shadow() {
        self.layer.shouldRasterize = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath =
              UIBezierPath(roundedRect: self.bounds,
              cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false

    }
}
