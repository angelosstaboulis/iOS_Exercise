//
//  APIManager.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 18/5/24.
//

import Foundation

class APIManager{
    func fetcPhotos(urlString:String,completion:@escaping ((ImageInfo)->())){
        DispatchQueue.main.async{
            guard let urlMain = URL(string:urlString) else {
                return
            }
            let request = URLRequest(url:urlMain)
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let getData = data else {
                    return
                }
                do{
                    completion(try JSONDecoder().decode(ImageInfo.self, from: getData))
                }catch{
                    debugPrint("something went wrong!!!"+error.localizedDescription)
                }
            }.resume()
        }
    }
}
