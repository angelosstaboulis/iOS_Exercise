//
//  ImageDownloader.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 19/5/24.
//

import Foundation
import UIKit
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let dataImage = data  else {
                return
            }
            if let loadedImage = UIImage(data: dataImage) {
                DispatchQueue.main.async{
                    self.image = loadedImage
                }
            }
        }.resume()
        
    }
}
