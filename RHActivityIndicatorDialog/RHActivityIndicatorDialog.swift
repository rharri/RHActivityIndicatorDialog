//
//  RHActivityIndicatorDialog.swift
//  RHActivityIndicatorDialog
//
//  Created by Ryan Harri on 2017-05-24.
//
//  Modified BSD License
//
//  Copyright (c) 2017-Present, Ryan Harri. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//
//  * Neither the name Ryan Harri nor the names of its contributors may be used
//    to endorse or promote products derived from this software without 
//    specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
//  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
//  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR 
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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
