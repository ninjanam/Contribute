//
//  ViewQuotesController.swift
//  Contribute
//
//  Created by Nam-Anh Vu on 3/21/19.
//  Copyright © 2019 TenTwelve. All rights reserved.
//

import UIKit

class ViewQuotesController: UIViewController {
    
    let quoteBody: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var quoteCat: PaulsQuote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
//        print("Quote name: ", quoteCat?.name)
        print("Quote authors: ", quoteCat?.text)
        
        view.addSubview(quoteBody)
        quoteBody.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        quoteBody.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        quoteBody.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 20)
        quoteBody.heightAnchor.constraint(equalTo: view.heightAnchor)
        //quoteBody.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        updateUI()
    }
    
    private func updateUI() {
       // quoteBody.text = quoteCat?.name
         quoteBody.text = quoteCat?.text
    }
}
