//
//  HomeViewController.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?
}
