//
//  Networking.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation

/// Result enum is a generic for any type of value
/// with success and failure case
public enum Result<T> {
    case success(T)
    case failure(Error)
}

// MARK: - Networking
final public class Networking: NSObject {
    // MARK: - Private functions
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)
        session.dataTask(with: url, completionHandler: completion).resume()
    }
    
    // MARK: - Public functions
    
    /// fetchWatchList function will fetch the Watch List Data and returns
    /// Result<WatchList> as completion handler
     public static func fetchWatchList(shouldFail: Bool = false, completion: @escaping (Result<WatchList>) -> Void) {
        var urlString: String?
        if shouldFail {
            urlString = EndPoints.test.rawValue
        } else {
            urlString = EndPoints.prod.rawValue
        }
        
        guard let mainUrlString = urlString,  let url = URL(string: mainUrlString) else { return }
        
        Networking.getData(url: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                let json = try decoder.decode(WatchList.self, from: data)
                completion(.success(json))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
    // requestImageData function will download the image data
    // returns Result<Data, Error> as completion handler
    public func requestImageData(shouldFail: Bool = false, url: URL,
                                     completion: @escaping (Result<Data>) -> Void) {
        Networking.getData(url: url) { data, response, error in

            if let error = error {
                DispatchQueue.main.async() {
                    completion(.failure(error))
                }
            }
            
            guard let data = data else {
                return
            }
            DispatchQueue.main.async() {
                completion(.success(data))
            }
        }
    }
}
