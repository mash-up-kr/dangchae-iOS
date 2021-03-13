//
//  DiaryBuilder.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/12.
//

import RIBs

protocol DiaryDependency: Dependency {
  // TODO: Declare the set of dependencies required by this RIB, but cannot be
  // created by this RIB.
}

final class DiaryComponent: Component<DiaryDependency> {
  
  // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol DiaryBuildable: Buildable {
  func build(withListener listener: DiaryListener) -> DiaryRouting
}

final class DiaryBuilder
: Builder<DiaryDependency>,
  DiaryBuildable
{
  
  override init(dependency: DiaryDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: DiaryListener) -> DiaryRouting {
    let component = DiaryComponent(dependency: dependency)
    let viewController = DiaryViewController()
    let interactor = DiaryInteractor(presenter: viewController)
    interactor.listener = listener
    return DiaryRouter(interactor: interactor, viewController: viewController)
  }
}
