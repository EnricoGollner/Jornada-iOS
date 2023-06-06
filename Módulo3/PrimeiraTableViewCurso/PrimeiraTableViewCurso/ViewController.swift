//
//  ViewController.swift
//  PrimeiraTableViewCurso
//
//  Created by Enrico Sousa Gollner on 04/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listName: [String] = ["Caio", "Albert", "Matheus", "Felipe", "Lucas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
    }
    
    // MARK: - Vamos fazer as configurações de nossa TableView:
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)  // Sem o register, ele não vai encontrar nosso identificador quando formos criar a célula e procurar pelo identifier
    }
}

// MARK: - PROTOCOLS TABLEVIEW

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  // Indica quantas células teremos.
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  // Retorna nosssa célula.
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.setUpCell(title: listName[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("O nome selecionado foi \(listName[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
