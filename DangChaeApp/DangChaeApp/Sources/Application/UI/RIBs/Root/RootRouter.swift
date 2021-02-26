//
//  RootRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
  func present(_ viewControllable: ViewControllable)
}

final class RootRouter:
  LaunchRouter<RootInteractable, RootViewControllable>,
  RootRouting
{
  
  private var loggedOutBuilder: LoggedOutBuildable
  
  private var loggedOutRouter: LoggedOutRouting?
  
  init(
    interactor: RootInteractable,
    viewController: RootViewControllable,
    loggedOutBuilder: LoggedOutBuildable
  ) {
    self.loggedOutBuilder = loggedOutBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    
    routeToLoggedOut()
  }
  
  func routeToLoggedOut() {
    let loggedOut = loggedOutBuilder.build(withListener: interactor)
    self.loggedOutRouter = loggedOut
    self.attachChild(loggedOut)
    self.viewController.present(loggedOut.viewControllable)
  }
  
  func routeToLoggedIn() {
    ()
  }
}
