//
//  ViewController.swift
//  DesafioTableViewSimples
//
//  Created by Enrico Sousa Gollner on 04/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTitlte: UILabel!
    
    let marcasCarro = ["Chevrolet", "Ford", "Volkswagen", "Honda", "Tesla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    func configTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CustomTableViewCell.getNib(), forCellReuseIdentifier: CustomTableViewCell.identifier)  // Registrando a célula para podermos acessá-la quando criarmos e retornarmos - Sem o register, ele não vai encontrar nosso identificador quando formos criar a célula
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marcasCarro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setUpCell(title: marcasCarro[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("A marca selecionada foi: \(marcasCarro[indexPath.row])")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

