//
//  ViewController.swift
//  PrimeiroProjetoCollectionViewCurso
//
//  Created by Enrico Sousa Gollner on 06/04/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let data: [String] = ["m4", "macLarenP1", "tesla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero  // Impedindo a collection view de utilizar seu jeito inteligente de se autoadequar para as telas. - Tudo o que a gente realmente escreve para que ele seja, ele vai ser. Diferente de deixar isso de maneira automática para a collection view tentar se montar.
        }
        collectionView.register(CustomCollectionViewCell.getNib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        
        cell?.setUpCell(nameImage: data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)  // view.frame.width é quando pegamos a largura máxima da nossa super.view (a tela mesmo)e no height estamos definindo o tamanho máximo, definido na sua constraint.
    }
}

