//
//  SignedUpBuilder.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs

protocol SignedUpDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SignedUpComponent: Component<SignedUpDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SignedUpBuildable: Buildable {
    func build(withListener listener: SignedUpListener) -> SignedUpRouting
}

final class SignedUpBuilder: Builder<SignedUpDependency>, SignedUpBuildable {

    override init(dependency: SignedUpDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SignedUpListener) -> SignedUpRouting {
        let component = SignedUpComponent(dependency: dependency)
        let viewController = SignedUpViewController()
        let interactor = SignedUpInteractor(presenter: viewController)
        interactor.listener = listener
        return SignedUpRouter(interactor: interactor, viewController: viewController)
    }
}
