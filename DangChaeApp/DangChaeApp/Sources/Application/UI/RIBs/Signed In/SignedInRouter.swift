//
//  SignedInRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs

protocol SignedInInteractable: Interactable {
    var router: SignedInRouting? { get set }
    var listener: SignedInListener? { get set }
}

protocol SignedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class SignedInRouter: Router<SignedInInteractable>, SignedInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: SignedInInteractable, viewController: SignedInViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    // MARK: - Private

    private let viewController: SignedInViewControllable
}
