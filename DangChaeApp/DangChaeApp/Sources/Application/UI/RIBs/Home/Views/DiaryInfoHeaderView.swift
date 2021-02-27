//
//  DiaryInfoHeaderView.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import UIKit

@IBDesignable
final class DiaryInfoHeaderView: UIView, XibLoadable {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupNib()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.setupNib()
  }
}
