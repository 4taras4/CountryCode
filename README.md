# CountryPicker

[![Build Status](https://travis-ci.org/4taras4/CountryCode.svg?branch=master)](https://travis-ci.org/4taras4/CountryCode)
[![Platform](https://img.shields.io/cocoapods/p/CountryPicker.svg?style=flat)](https://cocoapods.org/pods/CountryPickerSwift)
[![Swift version](https://img.shields.io/badge/Swift-3.1-orange.svg)]()

Picker code  Swift 3 .

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first. 
![1](http://i68.tinypic.com/w2bspi.png)


## Usage

Make your UIPickerView a class of CountryPicker, set its countryPickerDelegate and implement its countryPhoneCodePicker method.
Example:
```
import CountryPicker

class ViewController: UIViewController, CountryPickerDelegate {

    @IBOutlet weak var picker: CountryPicker!
   
    
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
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
       //pick up anythink
      code.text = phoneCode
    }

}
```

## Integration

#### CocoaPods (iOS 8+, OS X 10.9+)

CountryPicker is available through [CocoaPods](http://cocoapods.org). To install
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
[release-link]: https://github.com/4taras4/CountryCode/releases/latest
