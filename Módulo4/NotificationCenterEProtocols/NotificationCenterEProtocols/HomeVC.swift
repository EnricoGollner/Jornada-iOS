//
//  ViewController.swift
//  NotificationCenterEProtocols
//
//  Created by Enrico Sousa Gollner on 17/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.delegate(delegate: self)
//        configObserver()
    }

/* Abordagem para NotificationCenter:
    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook(notification:)), name: Notification.Name("macbook"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac(notification:)), name: Notification.Name("imac"), object: nil)
        
    }

    @objc func updateMacbook(notification: NSNotification) {
        homeScreen?.logoImageView.image = UIImage(named: "macbook_pro")
        homeScreen?.descriptionLabel.text = "MacBook"
        view.backgroundColor = .red
    }
    
    @objc func updateImac(notification: NSNotification) {
        homeScreen?.logoImageView.image = UIImage(named: "imac_pro")
        homeScreen?.descriptionLabel.text = "Imac das galaxias"
        view.backgroundColor = .cyan
    }
*/
    
}

extension HomeVC: HomeScreenProtocol {
    func tappedChooseButton() {
        let selectionVC = SelectionVC()
        selectionVC.modalPresentationStyle = .fullScreen
        selectionVC.delegate(delegate: self)
        present(selectionVC, animated: true)
    }
}

extension HomeVC: SelectionVCProtocol {
    func updateMac() {
        homeScreen?.logoImageView.image = UIImage(named: "macbook_pro")
        homeScreen?.descriptionLabel.text = "MacBook"
        view.backgroundColor = .red
    }
    
    func updateImac() {
        homeScreen?.logoImageView.image = UIImage(named: "imac_pro")
        homeScreen?.descriptionLabel.text = "Imac das galaxias"
        view.backgroundColor = .cyan
    }
}

