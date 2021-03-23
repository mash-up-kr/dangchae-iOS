//
//  Diary.Page.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/13.
//

import Foundation

extension Diary {
  struct Page: Hashable {
    let memberName: String
    let profileImageURL: URL?
    let titie: String
    let content: String
    let paper: Paper
  }
  
  enum Paper {
    case purple
    case cyan
    case apricot
  }
}
extension Diary.Page {
  static let samples = [
    Diary.Page(
      memberName: "이동영",
      profileImageURL: nil,
      titie: "토요일 해커톤 준비 중 👨‍💻",
      content: "내일 바로 매쉬업 해커톤 하는 날.\n그래서 우리 디자인팀은 내일을 위해 미리 디자인을 하고 있지. Baaam.",
      paper: .purple
    ),
    Diary.Page(
      memberName: "이문정",
      profileImageURL: nil,
      titie: "돈까스 먹는 중 🐷",
      content: "내일 바로 매쉬업 해커톤 하는 날.\n그래서 우리 디자인팀은 내일을 위해 미리 디자인을 하고 있지. Baaam.",
      paper: .cyan
    ),
    Diary.Page(
      memberName: "김용완",
      profileImageURL: nil,
      titie: "자는 중 😴!!!",
      content: "내일 바로 매쉬업 해커톤 하는 날.\n그래서 우리 디자인팀은 내일을 위해 미리 디자인을 하고 있지. Baaam.",
      paper: .apricot
    )
  ]
}
