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

final class RootComponent: Component<RootDependency> {
}

// MARK: - Builder

protocol RootBuildable: Buildable {
  func build() -> RootRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
  
  override init(dependency: RootDependency) {
    super.init(dependency: dependency)
  }
  
  func build() -> RootRouting {
    let component = RootComponent(dependency: dependency)
    let viewController = RootViewController()
    let interactor = RootInteractor(presenter: viewController)
    return RootRouter(
      interactor: interactor,
      viewController: viewController
    )
  }
}
