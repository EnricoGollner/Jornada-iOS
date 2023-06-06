//
//  ViewController.swift
//  TableViewComCollectionView
//
//  Created by Enrico Sousa Gollner on 10/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    let titlesData = ["Carros Esportivos"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomTableViewCell.getNib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell
        
        tableViewCell?.setUpCell(title: "Carros Esportivos")
        
        return tableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

