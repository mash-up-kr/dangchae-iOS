//
//  DiaryViewController.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/12.
//

import RIBs
import RxSwift
import UIKit

protocol DiaryPresentableListener: class {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
}

final class DiaryViewController: UIViewController, DiaryPresentable, DiaryViewControllable {
  
  weak var listener: DiaryPresentableListener?
  
}
