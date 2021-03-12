//
//  DiaryInteractor.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/12.
//

import RIBs
import RxSwift

protocol DiaryRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol DiaryPresentable: Presentable {
    var listener: DiaryPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol DiaryListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class DiaryInteractor: PresentableInteractor<DiaryPresentable>, DiaryInteractable, DiaryPresentableListener {

    weak var router: DiaryRouting?
    weak var listener: DiaryListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: DiaryPresentable) {
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
