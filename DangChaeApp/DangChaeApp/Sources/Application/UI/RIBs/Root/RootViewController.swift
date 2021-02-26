//
//  RootViewController.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
}

final class RootViewController:
  UIViewController,
  RootPresentable,
  RootViewControllable,
  StoryboardBuildable
{
  weak var listener: RootPresentableListener?
  
  func present(_ viewControllable: ViewControllable) {
    let viewController = viewControllable.uiviewController
    viewController.modalPresentationStyle = .fullScreen
    self.present(viewController, animated: true, completion: nil)
  }
}
