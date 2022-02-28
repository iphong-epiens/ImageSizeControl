//
//  ImageFilterControlView.swift
//  enlargeView
//
//  Created by Inpyo Hong on 2022/02/24.
//

import UIKit

class ImageFilterControlView: UIImageView {
    var tapGesture = UITapGestureRecognizer()
    var panGesture = UIPanGestureRecognizer()
    var pinchGesture = UIPinchGestureRecognizer()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.isUserInteractionEnabled = true
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureEvent))
        tapGesture.require(toFail: tapGesture)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureEvent))
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pichGestureEvent))

        self.gestureRecognizers = [tapGesture]//, panGesture, pinchGesture]
        self.backgroundColor = .clear
    }
    
    @objc func tapGestureEvent(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    @objc func panGestureEvent(_ sender: UITapGestureRecognizer) {
        print(#function)

    }

    @objc func pichGestureEvent(_ sender: UIPinchGestureRecognizer) {
        print(#function)
    }
}

extension ImageFilterControlView: UIGestureRecognizerDelegate {
  func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
    return true
  }
}
