//
//  RootRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol RootInteractable: Interactable, SignedOutListener {
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
  
  private var signedOutBuilder: SignedOutBuildable
  
  private var signedOutRouter: SignedOutRouting?
  
  // MARK: 🏁 Initialization
  init(
    interactor: RootInteractable,
    viewController: RootViewControllable,
    signedOutBuilder: SignedOutBuildable
  ) {
    self.signedOutBuilder = signedOutBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    
    routeToLoggedOut()
  }
  
  // MARK: ⛵️ Route
  func routeToLoggedOut() {
    let signedOut = signedOutBuilder.build(withListener: interactor)
    self.signedOutRouter = signedOut
    self.attachChild(signedOut)
    self.viewController.present(signedOut.viewControllable)
  }
  
  func routeToLoggedIn() {
    ()
  }
}
