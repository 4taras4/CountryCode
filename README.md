# CountryPicker

[![CI Status](http://img.shields.io/travis/4taras4/CountryPicker.svg?style=flat)](https://travis-ci.org/4taras4/CountryPicker)
[![Platform](https://img.shields.io/cocoapods/p/CountryPicker.svg?style=flat)](http://cocoapods.org/pods/CountryPicker)
[![Swift version](https://img.shields.io/badge/Swift-3.0.x-orange.svg)]()
[![Release][release-svg]][release-link]

Picker code  Swift 3 .

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first. 
![1](http://i68.tinypic.com/w2bspi.png)


## Usage

Make your UIPickerView a class of CountryPicker, set its countryPickerDelegate and implement its countryPhoneCodePicker method.

See the following example:

```
class ViewController: UIViewController, CountryPickerDelegate {

    @IBOutlet weak var countryPicker: CountryPicker!
   
    
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
    
    // a picker item was selected
    func countryPhoneCodePicker(picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
       //pick up anythink
      code.text = phoneCode
    }

}
```

## Installation

CountryPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CountryPicker', :git => 'https://github.com/4taras4/CountryCode.git' 
```

## Author

4taras4, 4taras4@gmail.com

## License

CountryPicker is available under the MIT license. See the LICENSE file for more info.
