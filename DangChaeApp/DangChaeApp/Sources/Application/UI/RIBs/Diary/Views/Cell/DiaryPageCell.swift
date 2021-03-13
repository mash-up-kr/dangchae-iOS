//
//  DiaryCell.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/13.
//

import UIKit

final class DiaryPageCell: UITableViewCell {
  @IBOutlet private weak var paperView: UIView!
  @IBOutlet private weak var memberNameLabel: UILabel?
  @IBOutlet private weak var profileImageView: UIImageView?
  @IBOutlet private weak var titleLabel: UILabel?
  @IBOutlet private weak var contentLabel: UILabel?
  
  func configure(with page: Diary.Page) {
    memberNameLabel?.text = page.memberName
    titleLabel?.text = page.titie
    contentLabel?.text = page.content
    switch page.paper {
    case .purple: paperView.backgroundColor = UIColor(named: "Purple1")
    case .cyan: paperView.backgroundColor = UIColor(named: "Cyan1")
    case .apricot: paperView.backgroundColor = UIColor(named: "Apricot1")
    }
  }
}
