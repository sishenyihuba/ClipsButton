//
//  ClipsButton.swift
//  ClipsButton
//
//  Created by macache on 2017/8/24.
//  Copyright © 2017年 dxl. All rights reserved.
//

import UIKit

@IBDesignable
public class ClipsButton: UIButton {

    // MARK: - pubic properties
    
    @IBInspectable public var clipsColor : UIColor = #colorLiteral(red: 0.9568627451, green: 0.2, blue: 0.1960784314, alpha: 1) {
        didSet {
            innerLayer.fillColor = clipsColor.cgColor
        }
    }
    
    @IBInspectable public var innerInset : CGFloat = 5.0 {
        didSet {
            innerLayer.path = UIBezierPath(roundedRect: bounds.insetBy(dx: innerInset, dy: innerInset), cornerRadius: bounds.height / 2).cgPath
        }
    }
    
    public var innerScale : CGFloat = 10.0
    
    //when we highlight the button ,the property changed
    public override var isHighlighted: Bool {
        didSet {
            guard oldValue != isHighlighted else { return }
            animationClipsButton()
        }
    }
    

    // MARK: - private properties
    private var  innerLayer : CAShapeLayer!
    
    // MARK: - public initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - private Method
    private func setupUI() {
        setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0), for: .highlighted)
        layer.cornerRadius = bounds.height / 2
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        
        innerLayer = CAShapeLayer()
        innerLayer.frame = bounds
        innerLayer.path = UIBezierPath(roundedRect: bounds.insetBy(dx: innerInset, dy: innerInset), cornerRadius: bounds.height / 2).cgPath
        innerLayer.fillColor = clipsColor.cgColor
        layer.addSublayer(innerLayer)
    }
    
    
    private func animationClipsButton() {
        let scaleX = 1 - (innerScale / innerLayer.bounds.width)
        let scaleY = 1 - (innerScale / innerLayer.bounds.height)
        let animationX = initAnimationWithKeyPath("transform.scale.x")
        let animationY = initAnimationWithKeyPath("transform.scale.y")

        if isHighlighted {
            animationX .toValue = scaleX
            innerLayer.add(animationX, forKey: "scale.x")

            animationY.toValue = scaleY
            innerLayer.add(animationY, forKey: "scale.y")
        } else {
            animationX.fromValue = scaleX
            animationX.toValue = 1.0
            innerLayer.add(animationX, forKey: "scale.x")

            animationY.fromValue = scaleY
            animationY.toValue = 1.0
            innerLayer.add(animationY, forKey: "scale.y")
        }
    }
    
    private func initAnimationWithKeyPath(_ path : String) -> CABasicAnimation{
        let animation = CABasicAnimation(keyPath: path)
        animation.duration = 0.25
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animation

    }

}
