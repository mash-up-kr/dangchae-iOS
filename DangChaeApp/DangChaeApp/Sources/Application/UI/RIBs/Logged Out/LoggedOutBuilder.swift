//
//  LoggedOutBuilder.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol SignedOutDependency: Dependency {
  // TODO: Declare the set of dependencies required by this RIB, but cannot be
  // created by this RIB.
}

final class SignedOutComponent: Component<SignedOutDependency> {
  
  // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SignedOutBuildable: Buildable {
  func build(withListener listener: SignedOutListener) -> SignedOutRouting
}

final class SignedOutBuilder:
  Builder<SignedOutDependency>,
  SignedOutBuildable
{
  
  // MARK: 🏁 Initialization
  override init(dependency: SignedOutDependency) {
    super.init(dependency: dependency)
  }
  
  // MARK: 🏗 Build
  func build(withListener listener: SignedOutListener) -> SignedOutRouting {
    let component = SignedOutComponent(dependency: dependency)
    let viewController = SignedOutViewController.instantiate()
    let interactor = SignedOutInteractor(presenter: viewController)
    interactor.listener = listener
    return SignedOutRouter(
      interactor: interactor,
      viewController: viewController
    )
  }
}
