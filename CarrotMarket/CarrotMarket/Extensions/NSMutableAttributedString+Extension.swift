//
//  NSMutableAttributedString+Extension.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/22.
//

import UIKit

extension NSMutableAttributedString {
    
    func stateText(with state: State, attributes: [NSAttributedString.Key:Any]) -> NSMutableAttributedString {
        guard let value = state.value else { return self }
        
        let imageAttachment = NSTextAttachment()
        
        imageAttachment.image = UIImage(systemName: state.imageSource)?.withTintColor(.gray)
        imageAttachment.bounds = CGRect(x: 0, y: -4, width: 15, height: 15)
        
        self.append(NSAttributedString(attachment: imageAttachment))
        self.append(NSAttributedString(string: " \(value) ", attributes: attributes))
        return self
    }
    
}
