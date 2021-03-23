//
//  DiaryInfoHeaderView.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import UIKit

@IBDesignable
final class DiaryInfoHeaderView: UIView, XibLoadable {

  @IBOutlet private weak var diaryTitleLabel: UILabel?
  @IBOutlet private weak var membersLabel: UILabel?
  @IBOutlet private weak var memberCountLabel: UILabel?
  @IBOutlet private weak var createdDateLabel: UILabel?
  
  @IBOutlet private var underlineWidthConstraints: [NSLayoutConstraint]?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupNib()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.setupNib()
  }
  
  func updateUnderline(withPercent percent: CGFloat) {
    underlineWidthConstraints?.forEach { $0.constant = percent * 250 }
    layoutIfNeeded()
  }
}
