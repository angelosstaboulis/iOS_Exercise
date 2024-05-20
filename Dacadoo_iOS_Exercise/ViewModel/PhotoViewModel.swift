//
//  PhotoViewModel.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 18/5/24.
//

import Foundation
class PhotoViewModel{
    let photoServices = APIManager()
    func getAllPhotos(urlString:String) async throws -> [Urls] {
        return try await photoServices.fetcPhotos(urlString: urlString).results.map{$0.urls}
    }
}
