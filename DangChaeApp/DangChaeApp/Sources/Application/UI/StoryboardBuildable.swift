//
//  StoryboardBuildable.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import UIKit

protocol StoryboardBuildable {
  static func instantiate() -> Self
}
extension StoryboardBuildable where Self: UIViewController {
  static func instantiate() -> Self {
    let className = String(describing: self)
    return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as! Self
  }
}
