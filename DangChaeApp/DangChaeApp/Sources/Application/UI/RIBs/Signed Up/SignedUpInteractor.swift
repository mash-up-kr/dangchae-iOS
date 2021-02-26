//
//  SignedUpInteractor.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs
import RxSwift

protocol SignedUpRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SignedUpPresentable: Presentable {
    var listener: SignedUpPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SignedUpListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SignedUpInteractor: PresentableInteractor<SignedUpPresentable>, SignedUpInteractable, SignedUpPresentableListener {

    weak var router: SignedUpRouting?
    weak var listener: SignedUpListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SignedUpPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
