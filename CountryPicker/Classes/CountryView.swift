//
//  CountryView.swift
//  Hyber
//
//  Created by Taras on 12/1/16.
//  Copyright © 2016 Taras Markevych. All rights reserved.
//


import Foundation
import UIKit

class NibLoadingView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    /// Init
    ///
    /// - Parameter frame: frame descript
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    /// Setup XIB
    fileprivate func nibSetup() {
        backgroundColor = UIColor.clear
        
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    /// Load XIB
    ///
    /// - Returns: XIBView
    fileprivate func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
}



/// Load country view from XIB file
class CountryView: NibLoadingView {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    init(theme: CountryViewTheme) {
        super.init(frame: .zero)
        setup(theme: theme)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        showFlagsBorder(true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        showFlagsBorder(true)
    }
    
    /// Setup custop pickerView to UIPickerView
    /// initialized by country code
    /// - Parameter country: Countrycode
    func setup(_ country: Country) {
        DispatchQueue.main.async { [weak self] in
            if let flag = country.flag {
                self?.flagImageView.image = flag
            }
        }
        countryNameLabel.text = country.name
        countryCodeLabel.text = country.phoneCode
    }
    
    private func setup(theme: CountryViewTheme) {
        view.backgroundColor = theme.rowBackgroundColor
        countryCodeLabel.textColor = theme.countryCodeTextColor
        countryNameLabel.textColor = theme.countryNameTextColor
        showFlagsBorder(theme.showFlagsBorder)
    }
    
    private func showFlagsBorder(_ showFlagsBorder: Bool) {
        guard showFlagsBorder else { return }
        flagImageView.layer.borderWidth = 0.5
        flagImageView.layer.borderColor = UIColor.darkGray.cgColor
        flagImageView.layer.cornerRadius = 1
        flagImageView.layer.masksToBounds = true
    }
}
