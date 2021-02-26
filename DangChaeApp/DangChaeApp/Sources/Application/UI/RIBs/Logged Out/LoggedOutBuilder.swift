//
//  LoggedOutBuilder.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs

protocol LoggedOutDependency: Dependency {
  // TODO: Declare the set of dependencies required by this RIB, but cannot be
  // created by this RIB.
}

final class LoggedOutComponent: Component<LoggedOutDependency> {
  
  // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoggedOutBuildable: Buildable {
  func build(withListener listener: LoggedOutListener) -> LoggedOutRouting
}

final class LoggedOutBuilder:
  Builder<LoggedOutDependency>,
  LoggedOutBuildable
{
  
  // MARK: 🏁 Initialization
  override init(dependency: LoggedOutDependency) {
    super.init(dependency: dependency)
  }
  
  // MARK: 🏗 Build
  func build(withListener listener: LoggedOutListener) -> LoggedOutRouting {
    let component = LoggedOutComponent(dependency: dependency)
    let viewController = LoggedOutViewController.instantiate()
    let interactor = LoggedOutInteractor(presenter: viewController)
    interactor.listener = listener
    return LoggedOutRouter(
      interactor: interactor,
      viewController: viewController
    )
  }
}
