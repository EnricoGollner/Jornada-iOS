//
//  Tela01.swift
//  DesafioTabBar
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class Tela01VC: UIViewController {

    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [UserData] = []
    let imagePicker = UIImagePickerController()
    var alert: AlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = AlertController(controller: self)  // Instânciamos a classe AlertController, passando nossa própria classe como controller
        configElements()
        configTableView()
        configImagePicker()
    }
    
    func configImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    
    func configElements() {
        view.backgroundColor = .lightGray
        selectedImage.image = UIImage(systemName: "person.circle.fill")
        selectedImage.contentMode = .scaleAspectFill
        selectedImage.tintColor = .black
        selectedImage.clipsToBounds = true  // Faz com que a imagem aceite alterações nas bordas
        selectedImage.layer.cornerRadius = selectedImage.frame.height / 2  // 50% da altura, resultará em 100% de arrendondamento
        
        nameTextField.placeholder = "Digite seu nome"
        nameTextField.delegate = self
        
        tableView.backgroundColor = .white
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.getNib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    @IBAction func tappedEditButton(_ sender: UIButton) {
        self.alert?.chooseImage(completion: { option in
            switch option {
            case .camera:
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    self.imagePicker.sourceType = .camera
                } else {
                    self.imagePicker.sourceType = .photoLibrary
                }
                self.present(self.imagePicker, animated: true)
            case .gallery:
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
            }
        })
    }
    
    @IBAction func tappedAddButton(_ sender: Any) {
        guard let selectedImage = selectedImage.image, let name = nameTextField.text else { return }
        
        if !selectedImage.isSymbolImage && name != "" {
            let newData = UserData(photo: selectedImage, name: name.capitalized)
            
            data.append(newData)
            nameTextField.text = ""
            self.selectedImage.image = UIImage(systemName: "person.circle.fill")
            tableView.reloadData()
        } else {
            self.alert?.alertInformation(title: "Erro", message:  "Você precisa adicionar ambos os dados")
        }
    }
    
}

// MARK: - Extensions

extension Tela01VC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.yellow.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension Tela01VC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell
        
        let dataRow = data[indexPath.row]
        
        customCell?.setUpCell(pickedImage: dataRow.photo, titleForLabel: dataRow.name)
        
        return customCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension Tela01VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.originalImage] as? UIImage else { return }
        
        self.selectedImage.image = pickedImage
        
        picker.dismiss(animated: true)
    }
}

