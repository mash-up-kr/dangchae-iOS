//
//  RootBuilder.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol RootDependency: Dependency {
  // TODO: Declare the set of dependencies required by this RIB, but cannot be
  // created by this RIB.
}

final class RootComponent:
  Component<RootDependency>,
  SignedOutDependency,
  SignedInDependency
{
  var signedInViewController: SignedInViewControllable
  
  init(
    dependency: RootDependency,
    signedInViewController: SignedInViewControllable
  ) {
    self.signedInViewController = signedInViewController
    super.init(dependency: dependency)
  }
}

// MARK: - Builder

protocol RootBuildable: Buildable {
  func build() -> RootRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
  
  // MARK: 🏁 Initialization
  override init(dependency: RootDependency) {
    super.init(dependency: dependency)
  }
  
  // MARK: 🏗 Build
  func build() -> RootRouting {
    let viewController = RootViewController.instantiate()
    let component = RootComponent(
      dependency: dependency,
      signedInViewController: viewController
    )
    let interactor = RootInteractor(presenter: viewController)
    let signedOutBuilder = SignedOutBuilder(dependency: component)
    let signedInBuilder = SignedInBuilder(dependency: component)
    return RootRouter(
      interactor: interactor,
      viewController: viewController,
      signedOutBuilder: signedOutBuilder,
      signedInBuilder: signedInBuilder
    )
  }
}
