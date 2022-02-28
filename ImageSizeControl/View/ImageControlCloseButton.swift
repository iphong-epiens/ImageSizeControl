//
//  ImageControlCloseButton.swift
//  enlargeView
//
//  Created by Inpyo Hong on 2022/02/24.
//

import UIKit

class ImageControlCloseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.setImage(UIImage(named: "imgClose")!, for: .normal)
        self.backgroundColor = .clear
    }

}
