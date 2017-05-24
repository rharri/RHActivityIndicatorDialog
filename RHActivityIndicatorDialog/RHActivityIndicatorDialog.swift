//
//  RHActivityIndicatorDialog.swift
//  RHActivityIndicatorDialog
//
//  Created by Ryan Harri on 2017-05-24.
//  Copyright © 2017 Ryan Harri. All rights reserved.
//

import UIKit

public class RHActivityIndicatorDialog: UIView {
    
    // MARK: - Type Properties
    
    public enum Style {
        case dark
        case light
    }
    
    private static let dark = UIColor(
        red: 0, green: 0, blue: 0, alpha: 0.70)
    
    private static let light = UIColor(
        red: 255, green: 255, blue: 255, alpha: 0.70)
    
    // MARK: - Instance Properties
    
    private let activityIndicator: UIActivityIndicatorView
    private let label: UILabel
    
    public var textColor: UIColor {
        get {
            return label.textColor
        }
        set {
            label.textColor = newValue
        }
    }
    
    public var font: UIFont {
        get {
            return label.font
        }
        set {
            label.font = newValue
        }
    }
    
    public var text: String {
        get {
            return label.text ?? ""
        }
        set {
            label.text = newValue
        }
    }
    
    // MARK: - Initialization
    
    convenience public init(text: String) {
        self.init(frame: CGRect.zero)
        self.text = text
    }
    
    convenience public init(text: String, style: Style) {
        self.init(frame: CGRect.zero)
        self.text = text
        setDialogStyle(style)
    }
    
    override public init(frame: CGRect) {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.startAnimating()
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
        label.text = "Loading..."
        
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.70)
        layer.cornerRadius = 10.0
        
        addSubview(activityIndicator)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: self.centerXAnchor),
            activityIndicator.topAnchor.constraint(
                equalTo: self.topAnchor, constant: 20),
            label.centerXAnchor.constraint(
                equalTo: self.centerXAnchor),
            label.bottomAnchor.constraint(
                equalTo: self.bottomAnchor, constant: -20)
            ])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods
    
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.centerXAnchor.constraint(
                    equalTo: superview.centerXAnchor),
                self.centerYAnchor.constraint(
                    equalTo: superview.centerYAnchor),
                self.heightAnchor.constraint(
                    equalToConstant: 100),
                self.widthAnchor.constraint(
                    equalToConstant: 220)
                ])
        }
    }
    
    public func dismiss(completion: (() -> Void)?) {
        removeFromSuperview()
        
        if let completion = completion {
            completion()
        }
    }
    
    public func setDialogStyle(_ style: Style) {
        switch style {
        case .dark:
            setStyle(activityIndicatorColor: UIColor.white,
                     textColor: UIColor.white,
                     backgroundColor: RHActivityIndicatorDialog.dark)
        case .light:
            setStyle(activityIndicatorColor: UIColor.black,
                     textColor: UIColor.black,
                     backgroundColor: RHActivityIndicatorDialog.light)
        }
    }
    
    private func setStyle(
        activityIndicatorColor: UIColor, textColor: UIColor, backgroundColor: UIColor) {
        
        activityIndicator.color = activityIndicatorColor
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
}
