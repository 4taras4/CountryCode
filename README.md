# CountryPicker

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Build Status](https://travis-ci.org/4taras4/CountryCode.svg?branch=master)](https://travis-ci.org/4taras4/CountryCode)
[![Platform](https://img.shields.io/cocoapods/p/CountryPicker.svg?style=flat)](https://cocoapods.org/pods/CountryPickerSwift)
[![Swift version](https://img.shields.io/badge/Swift-3.1-orange.svg)](https://cocoapods.org/pods/CountryPickerSwift)
[![Swift version](https://img.shields.io/badge/Swift-4-orange.svg)](https://cocoapods.org/pods/CountryPickerSwift)
[![Beerpay](https://beerpay.io/4taras4/CountryCode/badge.svg?style=flat)](https://beerpay.io/4taras4/CountryCode)

Picker code  Swift 3 / 4.

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first. 
![1](http://i68.tinypic.com/w2bspi.png)


## Usage

Make your UIPickerView a class of CountryPicker, set its countryPickerDelegate and implement its countryPhoneCodePicker method.

Example:

```swift
import CountryPicker

class ViewController: UIViewController, CountryPickerDelegate {

    @IBOutlet weak var picker: CountryPicker!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //get current country
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        //init Picker
        picker.displayOnlyCountriesWithCodes = ["DK", "SE", "NO", "DE"] //display only
        picker.exeptCountriesWithCodes = ["RU"] //exept country
        let theme = CountryViewTheme(countryCodeTextColor: .white, countryNameTextColor: .white, rowBackgroundColor: .black, showFlagsBorder: false)        //optional for UIPickerView theme changes
        picker.theme = theme //optional for UIPickerView theme changes
        picker.countryPickerDelegate = self
        picker.showPhoneNumbers = true
        picker.setCountry(code!)

    }
    
    // a picker item was selected
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
       //pick up anythink
      code.text = phoneCode
    }

}
```

## Integration

#### CocoaPods (iOS 8+, OS X 10.9+)

CountryPicker is available through [CocoaPods](http://cocoapods.org). To install

*Swift 4  (Xcode 10)*  `pod 'CountryPickerSwift', '1.8'`

*Swift 3.1 (Xcode 9)*  `pod 'CountryPickerSwift', '1.7'`

*Swift 3.0+ (Xcode 8)*  `pod 'CountryPickerSwift', '1.4.4'`

it, simply add the following line to your 'Podfile':

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'CountryPickerSwift'
end
```

#### Swift Package Manager

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `CountryPicker` by adding the proper description to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .Package(url: "git@github.com:4taras4/CountryCode.git")
    ]
)
```

Note that the [Swift Package Manager](https://swift.org/package-manager) is still in early design and development, for more information checkout its [GitHub Page](https://github.com/apple/swift-package-manager)

#### Manually

To use this library in your project manually just drag and drop CountryPicker folder to your project.

## Author

4taras4, 4taras4@gmail.com

## License

CountryPicker is available under the MIT license. See the LICENSE file for more info.
[release-link](https://github.com/4taras4/CountryCode/releases/latest)


## Donate

 Donation Bitcoin 141Q3KduSqvTtMbrU6YouSErDBh1SpiLrL 


## Support on Beerpay
Hey dude! Help me out for a couple of :beers:!

[![Beerpay](https://beerpay.io/4taras4/CountryCode/badge.svg?style=beer-square)](https://beerpay.io/4taras4/CountryCode)  [![Beerpay](https://beerpay.io/4taras4/CountryCode/make-wish.svg?style=flat-square)](https://beerpay.io/4taras4/CountryCode?focus=wish)
