//
//  View+IB.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import UIKit

extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get { layer.cornerRadius }
    set { layer.cornerRadius = newValue }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get { layer.borderWidth }
    set { layer.borderWidth = newValue }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get {
      guard let cgColor = layer.borderColor else { return nil }
      return UIColor(cgColor: cgColor)
    }
    set { layer.borderColor = newValue?.cgColor }
  }
  
  @IBInspectable var shadowRadius: CGFloat {
    get { layer.shadowRadius }
    set { layer.shadowRadius = newValue }
  }
  
  @IBInspectable var shadowOpacity: Float {
    get { layer.shadowOpacity }
    set { layer.shadowOpacity = newValue }
  }
  
  @IBInspectable var shadowOffset: CGSize {
    get { layer.shadowOffset }
    set { layer.shadowOffset = newValue }
  }
  
  @IBInspectable var shadowColor: UIColor? {
    get {
      guard let color: CGColor = layer.shadowColor else { return nil }
      return UIColor(cgColor: color)
    }
    set { layer.shadowColor = newValue?.cgColor }
  }
}

