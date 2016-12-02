//
//  CountryView.swift
//  Hyber
//
//  Created by Taras on 12/1/16.
//  Copyright © 2016 Taras Markevych. All rights reserved.
//


import UIKit

    class CountryView: UIView {
        
        @IBOutlet weak var flagImageView: UIImageView!
        @IBOutlet weak var countryNameLabel: UILabel!
        @IBOutlet weak var countryCodeLabel: UILabel!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required public init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        func setup(_ country: Country) {
            if let countryCode = country.code {
                flagImageView.layer.borderWidth = 0.5
                flagImageView.layer.borderColor = UIColor.darkGray.cgColor
                flagImageView.layer.cornerRadius = 1
                flagImageView.layer.masksToBounds = true
                flagImageView.image = UIImage(named: countryCode.lowercased())
            }
            
            countryNameLabel.text = country.name
            countryCodeLabel.text! = country.phoneCode!
        }
        
    }


