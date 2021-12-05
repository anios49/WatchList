//
//  Extensions.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import UIKit
// MARK: - UIColor extension
extension UIColor {
    /// get Appearance Color on basis of Dark and Light Mode
    /// The style associated with the user interface.
    public static func getAppearanceColor(_ color: UIColor) -> UIColor {
        UIColor.init { (trait) -> UIColor in
            switch color {
            case .black:
                return trait.userInterfaceStyle == .dark ? .systemPink : .black
            default:
                return trait.userInterfaceStyle == .dark ? .systemBlue : .gray
            }
        }
    }
}

// MARK: - UIViewController extension
extension UIViewController {
    /// Show Alert with two buttons
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - buttonTitle: Button title
    ///   - cancelButtonTitle: Cancel button title
    ///   - alertAction: Alert action
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   buttonTitle: String? = nil,
                   cancelButtonTitle: String? = nil,
                   alertAction: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)
        alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .default, handler: nil))
        DispatchQueue.main.async() {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /// Show Alert with one button
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - buttonTitle: Button title
    ///   - completion: Completion
    func showAlertWithOneButton(title: String? = nil,
                   message: String? = nil,
                   buttonTitle:String? = nil,
                   completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: completion)
    }
}


// MARK: - UIWindow extension
extension UIWindow {
    /// Check whether device is landscape or Portraits
    ///A Boolean value indicating whether the user interface is currently presented in a landscape orientation.
    static var isLandscape: Bool {
        return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape ?? false
    }
}
