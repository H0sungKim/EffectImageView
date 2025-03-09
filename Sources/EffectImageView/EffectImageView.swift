//
//  EffectImageView.swift
//  EffectImageView
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

@IBDesignable public class EffectImageView: UIImageView {
    
    private var originalImage: UIImage?
    
    @IBInspectable public override var image: UIImage? {
        get {
            return originalImage
        }
        set {
            originalImage = newValue
            reloadImage()
        }
    }
    
    @IBInspectable public var blur: CGFloat = 0.0 {
        didSet {
            reloadImage()
        }
    }
    
    @IBInspectable public var startColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            reloadImage()
        }
    }
    @IBInspectable public var endColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            reloadImage()
        }
    }
    
    @IBInspectable public var startPoint: CGPoint = CGPoint(x: 0, y: 0.5) {
        didSet {
            reloadImage()
        }
    }
    @IBInspectable public var endPoint: CGPoint = CGPoint(x: 1, y: 0.5) {
        didSet {
            reloadImage()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        reloadImage()
    }
    
    private func reloadImage() {
        super.image = originalImage?.withBlur(radius: blur).withGradient(startColor: startColor, endColor: endColor, startPoint: startPoint, endPoint: endPoint)
    }
}
