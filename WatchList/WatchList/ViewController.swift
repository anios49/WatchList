//
//  WatchListViewController.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import UIKit
import WatchListServices

class WatchListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Networking.fetchNineNewsData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                print(data)
            case .failure( _):
                print("fail")
            }
        }
    }


}

