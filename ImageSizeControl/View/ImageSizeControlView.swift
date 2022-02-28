//
//  ImageSizeControlView.swift
//  enlargeView
//
//  Created by Inpyo Hong on 2022/02/24.
//

import UIKit

enum ResizeOption: Int {
    case smaller = 0, bigger, none
}

class ImageSizeControlView: UIImageView {
    var panGesture = UIPanGestureRecognizer()
    private var lastSwipeBeginningPoint: CGPoint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.isUserInteractionEnabled = true
        
        self.layer.cornerRadius = self.frame.width/2

        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragImg))
        self.addGestureRecognizer(panGesture)
        
        self.image = UIImage(named: "imgSize")!
        self.backgroundColor = .clear
    }
    
    @objc func dragImg(_ sender:UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        
        print("translation",translation)
        
        if sender.state == .began {
            lastSwipeBeginningPoint = sender.location(in: sender.view)
        } else { //if sender.state == .ended {
            guard let beginPoint = lastSwipeBeginningPoint else {
                return
            }
            
            let endPoint = sender.location(in: sender.view)
            // TODO: use the x and y coordinates of endPoint and beginPoint to determine which direction the swipe occurred.
            
            print("beginPoint", beginPoint,"endPoint",endPoint)
            self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self)
            
//            let resizeCondition = isResizeTargetView(beginPoint: beginPoint,
//                                                     endPoint: endPoint)
//
//            guard resizeCondition != .none else { return }
//
//            let resizeValue = CGPointDistance(from: beginPoint, to: endPoint)
//
//            let bottomTrailingPoint = CGPoint(x: ImageSizeControlView.center.x + translation.x,
//                                              y: ImageSizeControlView.center.y + translation.y)
//
//            let resultRect = getTargetViewRect(resizeCondition,
//                                              resizeValue: resizeValue,
//                                              bottomTrailingPoint: bottomTrailingPoint)
//
//            let lastCenterPos = targetImgView.center
//
//            UIView.animate(withDuration: 0.1) { [weak self] in
//                guard let self = self else { return }
//                self.targetImgView.frame = resultRect
//                self.targetImgView.center = lastCenterPos
//
//                self.ImageSizeControlView.center = CGPoint(x: self.targetImgView.frame.maxX - 5, y: self.targetImgView.frame.maxY - 5)
//                self.closeBtn.center = CGPoint(x: self.targetImgView.frame.maxX - 5, y: self.targetImgView.frame.origin.y + 5)
//            }
//
//            sender.setTranslation(CGPoint.zero, in: self.view)
        }
    }
}
