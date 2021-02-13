//
//  ViewController.swift
//  CountryPicker
//
//  Created by 4taras4 on 12/02/2016.
//  Copyright (c) 2016 4taras4. All rights reserved.
//

import UIKit
import CountryPicker

class ViewController: UIViewController, CountryPickerDelegate  {
   
    @IBOutlet weak var picker: CountryPicker!
    @IBOutlet weak var code: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //get corrent country
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        //init Picker
        picker.countryPickerDelegate = self
        picker.showPhoneNumbers = true
//        let theme = CountryViewTheme(countryCodeTextColor: .white, countryNameTextColor: .white, rowBackgroundColor: .black, showFlagsBorder: true) //optional
//        picker.theme = theme //optional
        picker.setCountry(code ?? "UA")
    }
  
    // MARK: - CountryPhoneCodePicker Delegate
    public func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        code.text = phoneCode
    }

}


