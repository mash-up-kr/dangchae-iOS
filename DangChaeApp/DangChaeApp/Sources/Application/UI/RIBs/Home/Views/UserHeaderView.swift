//
//  UserHeaderView.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import UIKit
import RxCocoa

@IBDesignable
final class UserHeaderView: UIView, XibLoadable {
  
  @IBOutlet private weak var profileImageView: UIImageView?
  @IBOutlet private weak var nameLabel: UILabel?
  @IBOutlet private weak var ownedDiaryCountLabel: UILabel?
  @IBOutlet private weak var editProfileButton: UIButton?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupNib()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.setupNib()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    self.addBorder(.top, .bottom, color: .black, width: 1)
  }
  
  @IBAction private func editProfileButtonDidTap(_ sender: UIButton) {
  }
  
}
