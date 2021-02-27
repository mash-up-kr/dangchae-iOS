//
//  SignedInInteractor.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs
import RxSwift

protocol SignedInRouting: Routing {
    func cleanupViews()
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SignedInListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SignedInInteractor: Interactor, SignedInInteractable {

    weak var router: SignedInRouting?
    weak var listener: SignedInListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
}
