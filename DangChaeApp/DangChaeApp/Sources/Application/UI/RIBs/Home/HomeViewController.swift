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
  
}

final class HomeViewController:
  UIViewController,
  HomePresentable,
  HomeViewControllable,
  StoryboardBuildable
{
    weak var listener: HomePresentableListener?
}
