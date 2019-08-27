//
//  PhoneEntryViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/13/19.
//

import UIKit
import libPhoneNumber_iOS

class PhoneEntryViewController: AuthorizationBaseViewController<PhoneEntryView> {

    private let countryManager: CountryManager
    private var shouldSetPreferredCountry = true
    
    private var currentCountry: CountryInfo? {
        didSet {
            if let country = currentCountry {
                let title = "\(country.emojiFlag) \(country.displayedName)"

                contentView.countryButton.setTitle(title, for: [])
                contentView.countryButton.setTitleColor(.black, for: [])
            } else {
                contentView.countryButton.setTitle(L.Login.SelectCountry.Title, for: [])
                contentView.countryButton.setTitleColor(Constants.placeholderColor, for: [])
            }
        }
    }
    
    init(countryManager: CountryManager) {
        self.countryManager = countryManager
        
        super.init(contentView: .instantiateFromNib(), showsCancelButton: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Telegram"
        
        setupViews()
        
        processPhoneNumber(countryManager.defaultCountry.phoneCode)
        shouldSetPreferredCountry = true
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.authorizer?.setPhoneNumber("+48727870346", completionHandler: self.genericErrorHandler())
//        }
    }
    
    private func setupViews() {
        contentView.countryButton.addTarget(self, action: #selector(countryButtonTapped), for: .touchUpInside)
        
        contentView.countryCodeTextField.delegate = self
        contentView.numberTextField.delegate = self
    }
    
    // MARK: - Phone number
    
    private func processPhoneNumber(_ phoneNumber: String) {
        shouldSetPreferredCountry = false
        
        let phoneNumber = phoneNumber.removingNonDigits
        
        guard let country = countryManager.infoForPhoneNumber(phoneNumber) else {
            currentCountry = nil
            
            contentView.countryCodeTextField.text = "+" + String(phoneNumber.prefix(3))
            
            if phoneNumber.count > 3 {
                let startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 3)
                
                contentView.numberTextField.text = String(phoneNumber[startIndex...])
            } else {
                contentView.numberTextField.text = ""
            }
            
            return
        }
        
        currentCountry = country
        
        
        
        var formattedPhoneNumber = phoneNumber
        
//        if let example = try? NBPhoneNumberUtil.sharedInstance()!.getExampleNumber(forType: country.countryCode, type: .MOBILE),
//            let exampleNumber = try? NBPhoneNumberUtil.sharedInstance()!.format(example, numberFormat: .INTERNATIONAL) {
//            print("kek:", exampleNumber)
//        }
        
        if let number = try? NBPhoneNumberUtil.sharedInstance()!.parse("+" + phoneNumber, defaultRegion: country.countryCode),
            let string = try? NBPhoneNumberUtil.sharedInstance()!.format(number, numberFormat: .INTERNATIONAL) {
            formattedPhoneNumber = string.trimmingCharacters(in: CharacterSet(charactersIn: "+")).trimmingCharacters(in: .whitespaces)
        }
        
        let range = formattedPhoneNumber.range(of: country.phoneCode) ??
            formattedPhoneNumber.startIndex..<formattedPhoneNumber.index(formattedPhoneNumber.startIndex, offsetBy: 3)
        
        formattedPhoneNumber.removeSubrange(range)
        
        contentView.countryCodeTextField.text = "+" + country.phoneCode
        
        contentView.numberTextField.text = formattedPhoneNumber.trimmingCharacters(in: .whitespaces)
    }
    
    // MARK: - Actions
    
    @objc private func countryButtonTapped() {
        let controller = CountrySelectionViewController(countryManager: countryManager) { [weak self] country in
            self?.processPhoneNumber(country.phoneCode)
        }
        
        present(controller, animated: true, completion: nil)
    }
    
}

// MARK: - UITextFieldDelegate

extension PhoneEntryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text: String
        
        if string.count > 1 {
            text = string
        } else {
            text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
            
            if textField == contentView.countryCodeTextField {
                text += contentView.numberTextField.text ?? ""
            } else {
                text = (contentView.countryCodeTextField.text ?? "") + text
            }
        }
        
        processPhoneNumber(text)
        
        return false
    }
}
