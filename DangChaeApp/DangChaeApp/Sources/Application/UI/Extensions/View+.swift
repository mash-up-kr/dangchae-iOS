//
//  View+.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import UIKit

extension UIView {
  func addBorder(_ edges: UIRectEdge..., color: UIColor, width: CGFloat) {
    for edge in edges {
      let border = CALayer()
      switch edge {
      case .top:
        border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
        
      case .bottom:
        border.frame = CGRect(x: 0, y: frame.height - width, width: frame.width, height: width)
        
      case .left:
        border.frame = CGRect(x: 0, y: 0, width: width, height: frame.height)
        
      case .right:
        border.frame = CGRect(x: frame.width - width, y: 0, width: width, height: frame.height)
        
      default: ()
      }
      border.backgroundColor = color.cgColor;
      self.layer.addSublayer(border)
    }
  }
}
