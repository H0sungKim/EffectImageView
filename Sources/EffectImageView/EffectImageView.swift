//
//  EffectImageView.swift
//  EffectImageView
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

@IBDesignable public class EffectImageView: UIView {
    
    let mainImageView: UIImageView = UIImageView()
    
    private var effectImage: UIImage? {
        get {
            return image?
                .withBlur(radius: blur)
                .withGradient(
                    startColor: startColor,
                    endColor: endColor,
                    startPoint: startPoint,
                    endPoint: endPoint
                )
        }
    }
    
    @IBInspectable public var image: UIImage? {
        didSet {
            mainImageView.image = effectImage
        }
    }
    
    @IBInspectable public var blur: CGFloat = 0.0 {
        didSet {
            mainImageView.image = effectImage
        }
    }
    
    @IBInspectable public var startColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            mainImageView.image = effectImage
        }
    }
    @IBInspectable public var endColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            mainImageView.image = effectImage
        }
    }
    
    @IBInspectable public var startPoint: CGPoint = CGPoint(x: 0, y: 0.5) {
        didSet {
            mainImageView.image = effectImage
        }
    }
    @IBInspectable public var endPoint: CGPoint = CGPoint(x: 1, y: 0.5) {
        didSet {
            mainImageView.image = effectImage
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeImageView()
    }
    
    private func initializeImageView() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.contentMode = contentMode
        mainImageView.clipsToBounds = true
        addSubview(mainImageView)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
