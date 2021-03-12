//
//  DiaryCover.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/12.
//

import Foundation
import UIKit

struct DiaryCover: Hashable {
  enum Shape {
    case pentagon1
    case pentagon2
    case pentagon3
    case circle
  }
  
  let id: UUID = UUID()
  let shape: Shape
  let photo: UIImage?
}

extension DiaryCover {
  static let samples = [
    DiaryCover(shape: .pentagon1, photo: nil),
    DiaryCover(shape: .pentagon2, photo: nil),
    DiaryCover(shape: .pentagon3, photo: nil),
    DiaryCover(shape: .circle, photo: nil)
  ]
}

