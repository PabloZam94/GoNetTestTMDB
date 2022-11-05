//
//  Extensions.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
var gradientLayer : CAGradientLayer!

extension UIImageView {
    
    func DownloadImgFromURL(uri : String) {
        let url = URL(string: uri)
        image = nil
        
        if let imageFormCache = imageCache.object(forKey: uri as AnyObject) as? UIImage {
            self.image = imageFormCache
            
            return
        }
        
        if url != nil {
            let task = URLSession.shared.dataTask(with: url!) {responseData,response,error in
                if error == nil {
                    if let data = responseData {
                        
                        DispatchQueue.main.async {
                            
                            let imageToCache = UIImage(data: data)
                            if imageToCache != nil {
                                imageCache.setObject(imageToCache!, forKey: uri as AnyObject)
                                self.image = imageToCache
                                
                            }
                            
                        }
                        
                    }else {
                        print("no data")
                    }
                }else{
                    print("error")
                }
            }
            task.resume()
        }
    }
}

extension UIView {
    func setViewBorder(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
