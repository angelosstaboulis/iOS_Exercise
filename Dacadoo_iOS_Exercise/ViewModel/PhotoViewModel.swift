//
//  PhotoViewModel.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 18/5/24.
//

import Foundation
class PhotoViewModel{
    let photoServices = APIManager()
    func getAllPhotos(urlString:String,completion:@escaping ([Urls])->()){
        Task{
            await photoServices.fetcPhotos(urlString: urlString) { info in
                var urls:[Urls] = []
                for (_,value) in info.results.enumerated(){
                    urls.append(value.urls)
                }
                completion(urls)
            }
        }
    }
}
