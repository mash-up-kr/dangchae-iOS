//
//  LoggedOutRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol LoggedOutInteractable: Interactable {
  var router: LoggedOutRouting? { get set }
  var listener: LoggedOutListener? { get set }
}

protocol LoggedOutViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoggedOutRouter:
  ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable>,
  LoggedOutRouting
{
  // MARK: 🏁 Initialization
  override init(
    interactor: LoggedOutInteractable,
    viewController: LoggedOutViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
