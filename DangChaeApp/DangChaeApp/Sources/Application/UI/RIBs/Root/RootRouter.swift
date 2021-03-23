//
//  RootRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol RootInteractable: Interactable, SignedOutListener, SignedInListener {
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
  private var signedInBuilder: SignedInBuildable
  
  private var signedOutRouter: SignedOutRouting?
  private var signedInRouter: SignedInRouting?
  
  private var currentChild: Routing?
  
  // MARK: 🏁 Initialization
  init(
    interactor: RootInteractable,
    viewController: RootViewControllable,
    signedOutBuilder: SignedOutBuildable,
    signedInBuilder: SignedInBuildable
  ) {
    self.signedOutBuilder = signedOutBuilder
    self.signedInBuilder = signedInBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    routeToLoggedOut()
  }
  
  // MARK: ⛵️ Route
  func routeToLoggedOut() {
    detachCurrentChild()
    let signedOut = signedOutBuilder.build(withListener: interactor)
    self.signedOutRouter = signedOut
    self.currentChild = signedOut
    self.attachChild(signedOut)
    self.viewController.present(signedOut.viewControllable)
  }
  
  func routeToSignIn() {
    detachCurrentChild()
    let sigedInRouter = signedInBuilder.build(withListener: interactor)
    self.attachChild(sigedInRouter)
    self.currentChild = sigedInRouter
    self.signedInRouter = sigedInRouter
  }
  
  private func detachCurrentChild() {
    guard let currentChild = currentChild else { return }
    self.detachChild(currentChild)
    self.currentChild = nil
  }
}
