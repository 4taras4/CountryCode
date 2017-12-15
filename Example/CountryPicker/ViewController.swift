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
        picker.setCountry(code!)
    }
  
    // MARK: - CountryPhoneCodePicker Delegate
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        code.text = phoneCode
    }

}


