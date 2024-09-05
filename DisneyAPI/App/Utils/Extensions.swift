//
//  Extensions.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview( $0.self) })
    }
}

func haptics() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
    let generator2 = UIImpactFeedbackGenerator(style: .medium)
    generator2.impactOccurred()
}

extension UIViewController {
     func setNavBar(text: String) {
        if self.navigationController == nil {
            return
        }
        let navView = UIView()
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.sizeToFit()
        label.center = navView.center
        label.textAlignment = NSTextAlignment.center
        
        let image = UIImageView()
        image.image = UIImage(named: "logo")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let imageAspect = image.image!.size.width/image.image!.size.height
        image.frame = CGRect(x: label.frame.origin.x-label.frame.size.height*imageAspect,
                             y: label.frame.origin.y,
                             width: label.frame.size.height*imageAspect,
                             height: label.frame.size.height)
        image.contentMode = UIView.ContentMode.scaleAspectFit
        
        navView.addSubview(label)
        navView.addSubview(image)
        self.navigationItem.titleView = navView
        navView.sizeToFit()
    }
}

func formatDateToBrazilian(dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    guard let date = inputFormatter.date(from: dateString) else {
        return dateString
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "dd/MM/yyyy"
    outputFormatter.locale = Locale(identifier: "pt_BR")
    return outputFormatter.string(from: date)
}
