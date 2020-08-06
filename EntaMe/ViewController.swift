//
//  ViewController.swift
//  EntaMe
//
//  Created by Sumra Aarif on 2019/11/25.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import UIKit
import Domain
import Platform

class ViewController: UIViewController {
    
    var api: API<MovieResource>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let network = Network()
        let api = API<MovieResource>(network: network)
        self.api = api
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            try api.search(with: "super") { movies in
                print(movies)
            }
        } catch let err {
            print(err.localizedDescription)
        }
        
    }
}

