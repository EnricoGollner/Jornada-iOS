//
//  SelectionVC.swift
//  NotificationCenterEProtocols
//
//  Created by Enrico Sousa Gollner on 17/04/23.
//

import UIKit

protocol SelectionVCProtocol: AnyObject {
    func updateMac()
    func updateImac()
}

class SelectionVC: UIViewController {
    
    private weak var delegate: SelectionVCProtocol?
    
    public func delegate(delegate: SelectionVCProtocol?) {
        self.delegate = delegate
    }
    
    var selectionScreen: SelectionScreen?
    
    override func loadView() {
        selectionScreen = SelectionScreen()
        view = selectionScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionScreen?.delegate(delegate: self)
    }
}

extension SelectionVC: SelectionScreenProtocol {
    func tappedMacbookButton() {
//        NotificationCenter.default.post(name: Notification.Name("macbook"), object: nil)
        delegate?.updateMac()
        dismiss(animated: true)
    }
    
    func tappedImacButton() {
//        NotificationCenter.default.post(name: Notification.Name("imac"), object: nil)  // name é o identificador, o observador que queremos que realize a ação, apesar de todos os arquivos estiverem escutando o "grito". Object é Any? object que quisermos passar, podemos não passar também, por ser optional.
        delegate?.updateImac()
        dismiss(animated: true)
    }
}
