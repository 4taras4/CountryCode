//
//  CountryViewTheme.swift
//  CountryPickerSwift
//
//  Created by Semen Tolkachov on 16/03/2018.
//

import UIKit

public struct CountryViewTheme {
    
    public let countryCodeTextColor: UIColor
    public let countryNameTextColor: UIColor
    public let rowBackgroundColor: UIColor
    public let showFlagsBorder: Bool
    
    public init(countryCodeTextColor: UIColor = UIColor.gray, countryNameTextColor: UIColor = UIColor.darkGray, rowBackgroundColor: UIColor = UIColor.white, showFlagsBorder: Bool = true) {
        self.countryCodeTextColor = countryCodeTextColor
        self.countryNameTextColor = countryNameTextColor
        self.rowBackgroundColor = rowBackgroundColor
        self.showFlagsBorder = showFlagsBorder
    }
}
