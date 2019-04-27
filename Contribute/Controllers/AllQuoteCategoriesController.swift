//
//  ViewController.swift
//  Contribute
//
//  Created by Nam-Anh Vu on 3/14/19.
//  Copyright © 2019 TenTwelve. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBarItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "Contribute"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 160, height: 40)
        titleImageView.contentMode = .scaleAspectFit
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
        titleView.addSubview(titleImageView)
        titleView.backgroundColor = .clear
        navigationItem.titleView = titleImageView
    }
}

class AllQuoteCategoriesController: UITableViewController, CreateQuoteCategoriesControllerDelegate {

    private var addButton = UIButton()
    private let quoteCellID = "quoteCellID"
    
//    private var quoteCategories = [
//        QuoteCategory(name: "Mine", authors: ["Morning, Dreams, Workout, Fears"], dateAdded: Date()),
//        QuoteCategory(name: "Friends", authors: ["Breda, Kristina, Uncle Ajay"], dateAdded: Date()),
//        QuoteCategory(name: "Teachers", authors: ["Abraham Hicks, Vinh Giang, Bob Goff"], dateAdded: Date()),
//        QuoteCategory(name: "App devs", authors: ["Paul Hudson, Brian Voong, Angela Yu"], dateAdded: Date())
//    ]

    
//    private var quoteCategories = [
//        QuoteCategory(name: "Mine", dateAdded: Date()),
//        QuoteCategory(name: "Friends", dateAdded: Date()),
//        QuoteCategory(name: "Teachers", dateAdded: Date()),
//        QuoteCategory(name: "App devs", dateAdded: Date())
//    ]

//    private var quoteCategories = Bundle.main.decode([QuoteCategory].self, from: "quoteCategories.json")
//    private var quoteCategories = Bundle.main.decode([MainQuotes].self, from: "mainQuotes.json")
       private var quoteCategories = Bundle.main.decode([PaulsQuote].self, from: "paulsQuotes.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .white
        
        setupNavigationBarItems()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: quoteCellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createAddButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        addButton.isHidden = true
    }
    
    private func createAddButton() {
        addButton = UIButton(type: .custom)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(UIImage(named: "plus"), for: .normal)
        addButton.addTarget(self, action: #selector(handleAddQuoteCat), for: UIControl.Event.touchUpInside)
        // We're manipulating the UI, must be on the main thread: [Check if this is true]
      //  DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(self.addButton)
                NSLayoutConstraint.activate([
                    keyWindow.trailingAnchor.constraint(equalTo: self.addButton.trailingAnchor, constant: 20),
                    keyWindow.bottomAnchor.constraint(equalTo: self.addButton.bottomAnchor, constant: 20),
                    self.addButton.widthAnchor.constraint(equalToConstant: 75),
                    self.addButton.heightAnchor.constraint(equalToConstant: 75)])
            }
            // Make the button round:
            self.addButton.layer.cornerRadius = 37.5
            // Add a black shadow:
            self.addButton.layer.shadowColor = UIColor.lightGray.cgColor
            self.addButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            self.addButton.layer.masksToBounds = false
            self.addButton.layer.shadowRadius = 3.0
            self.addButton.layer.shadowOpacity = 1.0
     //   }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(hue: 0.75, saturation: 0.03, brightness: 0.97, alpha: 0.5)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: quoteCellID, for: indexPath)
        
        let quoteCategory = quoteCategories[indexPath.row]
//        cell.textLabel?.text = quoteCategory.authors[0]
//        cell.textLabel?.text = quoteCategory.name
        cell.textLabel?.text = quoteCategory.text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let quoteCat = self.quoteCategories[indexPath.row]
        let viewQuotesController = ViewQuotesController()
        viewQuotesController.quoteCat = quoteCat
        navigationController?.pushViewController(viewQuotesController, animated: true)
    }
    
    func didAddQuoteCat(quoteCat: PaulsQuote) {

        quoteCategories.append(quoteCat)
        
        let newIndexPath = IndexPath(row: quoteCategories.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    

    @objc func handleAddQuoteCat() {
        print("Adding a quote cat, ahoy!")
        
        let createQuoteCatController = CreateQuoteCategoriesController()
        let navController = CustomNavigationController(rootViewController: createQuoteCatController)
        
        createQuoteCatController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
}

