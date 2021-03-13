//
//  DiaryCover.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/12.
//

import Foundation
import UIKit

extension Diary {
  struct Cover: Hashable {
    
    let id: UUID = UUID()
    let shape: Shape
    let photo: UIImage?
  }
}

extension Diary.Cover {
  enum Shape {
    case pentagon1
    case pentagon2
    case pentagon3
    case circle
  }
}

extension Diary.Cover {
  static let samples = [
    Diary.Cover(shape: .pentagon1, photo: nil),
    Diary.Cover(shape: .pentagon2, photo: nil),
    Diary.Cover(shape: .pentagon3, photo: nil),
    Diary.Cover(shape: .circle, photo: nil)
  ]
}
