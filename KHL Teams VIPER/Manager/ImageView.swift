//
//  Manager.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(with url: String?) {
        guard let url = url else { return }
        guard let imageURL = url.getURL() else {
            image = #imageLiteral(resourceName: "img_48334")
            return
        }
        
        //если изобрадение есть в кэше, то используем его
        if let cachedImage = getCachedImage(url: imageURL) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else { return }
            
            if responseURL.absoluteString != url { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            // сохраняем изображение в кэш
            self.saveImageToCache(data: data, response: response)
            
            } . resume()
    }
    
    
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        // запрос в кэш по url адресу
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheResponse.data)
        }
        return nil
    }
    
}

fileprivate extension String {
    
    func getURL() -> URL? {
        guard let url = URL(string: self) else { return nil}
        return url
        
    }
}
