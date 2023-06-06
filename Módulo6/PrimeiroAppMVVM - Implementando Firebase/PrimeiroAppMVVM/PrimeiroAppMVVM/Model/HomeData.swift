//
//  HomeData.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 27/04/23.
//

import UIKit

/*
 Decodable:
 Decodifica -> Transforma um JSON em um Objeto
 
 Encodable:
 Codifica um objeto, ou seja, tornar um tipo de dado no Swift em JSON. (Contrário de Decodable / Operação inversa)
 
 Codable:
 Codigica e decodifica.
*/

// MARK: - HomeData
struct HomeData: Codable {
    var stories: [Stories]?
    var posts: [Posts]?
}

