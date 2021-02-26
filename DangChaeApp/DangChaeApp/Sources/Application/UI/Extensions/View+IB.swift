//
//  View+IB.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import UIKit

extension UIView {
  @IBInspectable
  var cornerRadius: CGFloat {
    get { layer.cornerRadius }
    set { layer.cornerRadius = newValue }
  }
  
  @IBInspectable
  var borderWidth: CGFloat {
    get { layer.borderWidth }
    set { layer.borderWidth = newValue }
  }
  
  @IBInspectable
  var borderColor: UIColor? {
    get {
      guard let cgColor = layer.borderColor else { return nil }
      return UIColor(cgColor: cgColor)
    }
    set { layer.borderColor = newValue?.cgColor }
  }
}
