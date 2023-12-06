//
//  UIImageViewExtension.swift
//  Profile
//  Created by Студент on 15.11.2023.
//
import Foundation
import UIKit

extension UIImageView
{
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    if let imageData = data as NSData? {
                        OperationQueue.main.addOperation({ // уходим в главный поток
                            self.image = UIImage(data: imageData as Data)
                        })
                    }
                }
            }
            task.resume()
        }
    }
    
    public func imageClear() {
        OperationQueue.main.addOperation({ // уходим в главный поток
            self.image = nil
        })
    }
}
