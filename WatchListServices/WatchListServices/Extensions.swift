//
//  Extensions.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
let networking = Networking()

extension UIImageView {
    /// load image in imageview
    /// - Parameter urlSting: image url string
    public func loadImage(urlSting: String) {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
        
        guard let url = URL(string: urlSting) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
            image = imageFromCache as? UIImage
            activityIndicator.removeFromSuperview()
            return
        }

        networking.requestImageData(url: url) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                activityIndicator.removeFromSuperview()
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: urlSting as AnyObject)
                self.image = UIImage(data: data)
            case .failure(_):
                activityIndicator.removeFromSuperview()
                self.image = UIImage(named: "Placeholders")
            }
        }
    }
}
