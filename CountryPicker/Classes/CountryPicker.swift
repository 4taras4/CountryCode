//
//  CountryPicker.swift
//  Hyber
//
//  Created by Taras on 12/1/16.
//  Copyright © 2016 Taras Markevych. All rights reserved.
//

import CoreTelephony
import Foundation
import UIKit

/// CountryPickerDelegate
///
/// - Parameters:
///   - picker: UIPickerVIew
///   - name: Name of selected element
///   - countryCode: Country code shortcut
///   - phoneCode: Phone digit code of country
///   - flag: Flag of country
public protocol CountryPickerDelegate {
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelect country: Country)
}

/// Structure of country code picker
public struct Country {
    public let code: String?
    public let name: String?
    public let phoneCode: String?
    public let flagName: String?
    public let flagURL: URL?

    /// Country code initialization
    ///
    /// - Parameters:
    ///   - code: String
    ///   - name: String
    ///   - phoneCode: String
    ///   - flagName: String
    init(code: String?, name: String?, phoneCode: String?, flagName: String?) {
        self.code = code
        self.name = name
        self.phoneCode = phoneCode
        self.flagName = flagName
        flagURL = nil
    }

    /// - Parameters:
    ///   - code: String
    ///   - name: String
    ///   - phoneCode: String
    ///   - flagName: String
    ///   - flagURLString: String
    public init(code: String?, name: String?, phoneCode: String?, flagURLString: String?) {
        self.code = code
        self.name = name
        self.phoneCode = phoneCode
        flagName = nil
        if let flagURLString = flagURLString {
            flagURL = URL(string: flagURLString)
        } else {
            flagURL = nil
        }
    }

    public var flag: UIImage? {
        if let flagName = flagName {
            return UIImage(named: flagName, in: Bundle(for: CountryPicker.self), compatibleWith: nil)
        }
        return nil
    }
}

public class CountryPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate {
    open var currentCountry: Country?
    public var displayOnlyCountriesWithCodes: [String]?
    public var exeptCountriesWithCodes: [String]?

    public lazy var countries: [Country] = {
        let allCountries: [Country] = CountryPicker.countryNamesByCode()
        if let display = displayOnlyCountriesWithCodes {
            let filtered = allCountries.filter { country in display.contains(where: { code in country.code == code }) }
            return filtered
        }
        if let display = exeptCountriesWithCodes {
            let filtered = allCountries.filter { country in display.contains(where: { code in country.code != code }) }
            return filtered
        }
        return allCountries
    }()

    public var countryPickerDelegate: CountryPickerDelegate?
    public var showPhoneNumbers: Bool = false
    open var theme: CountryViewTheme?

    init() {
        super.init(frame: .zero)
        setup()
    }

    /// init
    ///
    /// - Parameter frame: initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    /// Setup country code picker
    func setup() {
        super.dataSource = self
        super.delegate = self

        let tap = UITapGestureRecognizer(target: self, action: #selector(pickerTapped(tapRecognizer:)))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        addGestureRecognizer(tap)
    }

    // MARK: - Country Methods

    /// setCountry
    ///
    /// - Parameter code: selected country
    public func setCountry(_ code: String) {
        var row = 0
        for index in 0 ..< countries.count {
            if countries[index].code == code {
                row = index
                currentCountry = countries[index]
                break
            }
        }

        selectRow(row, inComponent: 0, animated: true)
        let country = countries.dropFirst(row).first
        currentCountry = country
        if let country = country,
           let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelect: country)
        }
    }

    /// setCountryByPhoneCode
    /// Init with phone code
    /// - Parameter phoneCode: String
    public func setCountryByPhoneCode(_ phoneCode: String) {
        var row = 0
        for index in 0 ..< countries.count {
            if countries[index].phoneCode == phoneCode {
                row = index
                currentCountry = countries[index]
                break
            }
        }

        selectRow(row, inComponent: 0, animated: true)
        let country = countries.dropFirst(row).first
        currentCountry = country
        if let country = country,
           let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelect: country)
        }
    }

    // Populates the metadata from the included json file resource

    /// sorted array with data
    ///
    /// - Returns: sorted array with all information phone, flag, name
    private static func countryNamesByCode() -> [Country] {
        var countries = [Country]()
        let frameworkBundle = Bundle(for: self)
        guard let jsonPath = frameworkBundle.path(forResource: "CountryPicker.bundle/Data/countryCodes", ofType: "json"), let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
            return countries
        }

        do {
            if let jsonObjects = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? NSArray {
                for jsonObject in jsonObjects {
                    guard let countryObj = jsonObject as? NSDictionary else {
                        return countries
                    }

                    guard let code = countryObj["code"] as? String, let phoneCode = countryObj["dial_code"] as? String, let name = countryObj["name"] as? String else {
                        return countries
                    }

                    let flagName = "CountryPicker.bundle/Images/\(code.uppercased())"

                    let country = Country(code: code, name: name, phoneCode: phoneCode, flagName: flagName)
                    countries.append(country)
                }
            }
        } catch {
            return countries
        }
        return countries
    }

    // MARK: - Picker Methods

    open func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    /// pickerView
    ///
    /// - Parameters:
    ///   - pickerView: CountryPicker
    ///   - component: Int
    /// - Returns: counts of array's elements
    open func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }

    /// PickerView
    /// Initialization of Country pockerView
    /// - Parameters:
    ///   - pickerView: UIPickerView
    ///   - row: row
    ///   - component: count of countries
    ///   - view: UIView
    /// - Returns: UIView
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var resultView: CountryView

        if view == nil {
            if let theme = self.theme {
                resultView = CountryView(theme: theme)
            } else {
                resultView = CountryView()
            }
        } else {
            resultView = view as! CountryView
        }

        resultView.setup(countries[row])
        if !showPhoneNumbers {
            resultView.countryCodeLabel.isHidden = true
        }
        return resultView
    }

    /// Function for handing data from UIPickerView
    ///
    /// - Parameters:
    ///   - pickerView: CountryPickerView
    ///   - row: selectedRow
    ///   - component: description
    open func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let country = countries[row]
        currentCountry = country
        if let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelect: country)
        }
    }

    @objc
    func pickerTapped(tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let rowHeight: CGFloat = rowSize(forComponent: 0).height
            let selectedRowFrame: CGRect = bounds.insetBy(dx: 0, dy: (frame.height - rowHeight) / 2.0)
            let userTappedOnSelectedRow = selectedRowFrame.contains(tapRecognizer.location(in: self))
            if userTappedOnSelectedRow {
                pickerView(self, didSelectRow: selectedRow(inComponent: 0), inComponent: 0)
            }
        }
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
