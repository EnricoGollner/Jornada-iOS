//
//  HomeService.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 27/04/23.
//

import UIKit
import Alamofire

enum ErrorDetail: Swift.Error {  // Enum para customizar tipos de erro
    case errorURLString(urlString: String)
    case detailError(detail: String)
}

class HomeService {
    
    func getHomeDataURLSession(completion: @escaping (HomeData?, Error?) -> Void) {
        let urlString: String = "https://run.mocky.io/v3/27f89405-f3d4-4366-91c0-183c88586fd7"
        
        guard let url = URL(string: urlString) else { return completion(nil, ErrorDetail.errorURLString(urlString: urlString)) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return completion(nil, ErrorDetail.detailError(detail: "Error Data")) }
            
            let json = try? JSONSerialization.jsonObject(with: dataResult)
            print(json as Any)
            
            guard let response = response as? HTTPURLResponse else { return completion(nil, ErrorDetail.detailError(detail: "Error Response")) }
            
            if response.statusCode == 200 {
                do {
                    let homeData = try JSONDecoder().decode(HomeData.self, from: dataResult)
                    print("SUCCESS -> \(#function)")
                    completion(homeData, nil)
                } catch {
                    print("ERRO -> \(#function)")
                    completion(nil, error)
                }
            } else {
                print("ERRO -> \(#function)")
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    
    func getHomeDataAlamofire(completion: @escaping (HomeData?, Error?) -> Void) {
        let url: String = "https://run.mocky.io/v3/27f89405-f3d4-4366-91c0-183c88586fd7"
        
        AF.request(url, method: .get).validate().responseDecodable(of: HomeData.self) { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("FAILURE -> \(#function)")
                completion(nil, error)
            }
        }
    }

    // Decodificando o JSON para transformá-lo em objeto:
    func getHomeDataJSON(completion: @escaping (HomeData?, Error?) -> Void) {  // Recebe uma HomeData? caso der certo e um Error? caso der erro na requisição
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {  // Buscando o destino do arquivo "HomeData.json"
            do {
                let data = try Data(contentsOf: url)  // Tentando transformar o arquivo da url e transformando-o em formato de Data binário
                let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: data)   // Transforme nosso Data em nosso objeto"
                completion(homeData, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
}
