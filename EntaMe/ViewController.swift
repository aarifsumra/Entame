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
    
    var api: API<Resources.TV.Season>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let network = Network()
        let api = API<Resources.TV.Season>(network: network)
        self.api = api
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
//            try api.search(with: "super") { tvs in
//                print(tvs)
//            }
            try api.fetchDetail(id: 10444, forParent: 106989, resultHandler: { result in
                print(result)
            })
            
        } catch let err {
            print(err.localizedDescription)
        }
    }
}

