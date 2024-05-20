//
//  APIManager.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 18/5/24.
//

import Foundation

class APIManager{
    func fetcPhotos(urlString:String) async throws -> ImageInfo {
            guard let url = URL(string:urlString) else{
                return ImageInfo(total: 0, totalPages: 0, results: [])
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(ImageInfo.self, from: data)
    }
}
