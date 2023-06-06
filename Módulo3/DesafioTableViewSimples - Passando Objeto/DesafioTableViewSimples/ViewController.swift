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
    
    let listBrand: [Car] = [
        Car(brand: "Chevrolet", brandImage: UIImage(named: "chevrolet")  ?? UIImage()),
        Car(brand: "BMW", brandImage: UIImage(named: "bmw") ?? UIImage()),
        Car(brand: "Honda", brandImage: UIImage(named: "honda") ?? UIImage()),
        Car(brand: "Tesla", brandImage: UIImage(named: "tesla") ?? UIImage()),
        Car(brand: "Audi", brandImage: UIImage(named: "audi") ?? UIImage())
    ]
    
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
        return listBrand.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setUpCell(listBrand[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tableView.deselectRow(at: indexPath, animated: true)
        print("A marca selecionada foi: \(listBrand[indexPath.row].brand)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
