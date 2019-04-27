//
//  CustomNavigationController.swift
//  Contribute
//
//  Created by Nam-Anh Vu on 3/14/19.
//  Copyright © 2019 TenTwelve. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.shadowImage = UIImage() // hides bottom nav border
        
    }
}


