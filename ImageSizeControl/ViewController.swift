//
//  ViewController.swift
//  enlargeView
//
//  Created by Inpyo Hong on 2022/02/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var filterImgView: UIImageView!
    
    var sizeControlView: ImageSizeControlView!
    var closeBtn: ImageControlCloseButton!
    var imageControlView: ImageFilterControlView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageControlView = ImageFilterControlView(frame: self.filterImgView.frame)
        imageControlView.layer.borderWidth = 1
        imageControlView.layer.borderColor = UIColor.gray.cgColor
        imageControlView.backgroundColor = .clear
        
        sizeControlView = ImageSizeControlView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 30, height: 30)))
        sizeControlView.center = CGPoint(x: imageControlView.frame.maxX - 5, y: imageControlView.frame.maxY - 5)
        
        closeBtn = ImageControlCloseButton(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 30, height: 30)))
        closeBtn.center = CGPoint(x: imageControlView.frame.maxX - 5, y: imageControlView.frame.origin.y + 5)
        closeBtn.addTarget(self, action: #selector(tapCloseBtn), for: .touchUpInside)

        controlView.addSubview(imageControlView)
        controlView.addSubview(sizeControlView)
        controlView.addSubview(closeBtn)
    }
    
    @objc func tapCloseBtn(_ sender: AnyObject){
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let self = self else { return }
            self.sizeControlView.removeFromSuperview()
            self.closeBtn.removeFromSuperview()
            self.imageControlView.removeFromSuperview()
            
            self.filterImgView.removeFromSuperview()
        }
    }
}

extension UIViewController {
    func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }
    
    func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        let input = CGPointDistanceSquared(from: from, to: to)
        return sqrt(input)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
    return true
  }
}
