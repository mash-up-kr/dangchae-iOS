//
//  LoggedOutRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol SignedOutInteractable: Interactable {
  var router: SignedOutRouting? { get set }
  var listener: SignedOutListener? { get set }
}

protocol SignedOutViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SignedOutRouter:
  ViewableRouter<SignedOutInteractable, SignedOutViewControllable>,
  SignedOutRouting
{
  
  // MARK: 🏁 Initialization
  override init(
    interactor: SignedOutInteractable,
    viewController: SignedOutViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
