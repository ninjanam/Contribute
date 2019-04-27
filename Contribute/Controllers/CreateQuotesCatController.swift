//
//  CreateQuotesCatController.swift
//  Contribute
//
//  Created by Nam-Anh Vu on 3/15/19.
//  Copyright © 2019 TenTwelve. All rights reserved.
//

import UIKit

protocol CreateQuoteCategoriesControllerDelegate {
    func didAddQuoteCat(quoteCat: MainQuotes) 
}

class CreateQuoteCategoriesController: UIViewController {
    
    var delegate: CreateQuoteCategoriesControllerDelegate?
    
    let quoteCatLabel: UILabel = {
        let label = UILabel()
        label.text = "Quote Category"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let quoteCatTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name your group"
        textField.textColor = .purple
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        setupNavigationBarItems()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelQuoteCat))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handlSaveQuoteCat))
        
        setupUI()
    }
    
    private func setupUI() {
        
        let lightBackgroundView = UIView()
        lightBackgroundView.backgroundColor = UIColor.white
        lightBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBackgroundView)
        lightBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(quoteCatLabel)
        quoteCatLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        quoteCatLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        quoteCatLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        quoteCatLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(quoteCatTextField)
        quoteCatTextField.topAnchor.constraint(equalTo: quoteCatLabel.topAnchor).isActive = true
        quoteCatTextField.leftAnchor.constraint(equalTo: quoteCatLabel.rightAnchor).isActive = true
        quoteCatTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        quoteCatTextField.bottomAnchor.constraint(equalTo: quoteCatLabel.bottomAnchor).isActive = true
    }
    
    @objc func handleCancelQuoteCat() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handlSaveQuoteCat() {
        print("Trying to save...")
        
//        dismiss(animated: true) {
//            guard let name = self.quoteCatTextField.text else  { return }
//            
////            let quoteCat = QuoteCategory(name: name, dateAdded: Date())
//      //      let quoteCat = PaulsQuote(text: "some quote text", author: name)
//         //   let quoteCat = MainQuotes(name: "some name", )
//            
//            self.delegate?.didAddQuoteCat(quoteCat: quoteCat)
//        }
    }
}
