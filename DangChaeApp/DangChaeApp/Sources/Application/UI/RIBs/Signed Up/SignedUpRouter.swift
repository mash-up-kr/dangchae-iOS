//
//  SignedUpRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs

protocol SignedUpInteractable: Interactable {
    var router: SignedUpRouting? { get set }
    var listener: SignedUpListener? { get set }
}

protocol SignedUpViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SignedUpRouter: ViewableRouter<SignedUpInteractable, SignedUpViewControllable>, SignedUpRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SignedUpInteractable, viewController: SignedUpViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
