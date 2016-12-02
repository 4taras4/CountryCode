//
//  ViewController.swift
//  CountryPicker
//
//  Created by 4taras4 on 12/02/2016.
//  Copyright (c) 2016 4taras4. All rights reserved.
//

import UIKit
import CountryPicker
class ViewController: UIViewController, CountryPhoneCodePickerDelegate  {
    
    @IBOutlet weak var picker: CountryPicker!
    @IBOutlet weak var code: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Country codes
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        picker.countryPhoneCodeDelegate = self
        picker.setCountry(code!)
        
    }
    
    // MARK: - CountryPhoneCodePicker Delegate
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryCountryWithName name: String, countryCode: String, phoneCode: String ) {
        code.text = phoneCode
        
    }
}


