//
//  SignedInBuilder.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs

protocol SignedInDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var signedInViewController: SignedInViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class SignedInComponent: Component<SignedInDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var signedInViewController: SignedInViewControllable {
        return dependency.signedInViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SignedInBuildable: Buildable {
    func build(withListener listener: SignedInListener) -> SignedInRouting
}

final class SignedInBuilder: Builder<SignedInDependency>, SignedInBuildable {

    override init(dependency: SignedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SignedInListener) -> SignedInRouting {
        let component = SignedInComponent(dependency: dependency)
        let interactor = SignedInInteractor()
        interactor.listener = listener
        return SignedInRouter(interactor: interactor, viewController: component.signedInViewController)
    }
}
