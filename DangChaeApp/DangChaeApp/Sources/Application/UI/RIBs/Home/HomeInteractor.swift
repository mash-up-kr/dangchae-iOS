//
//  HomeInteractor.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs
import RxSwift

protocol HomeRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
  func routeTo(diary: Diary.Cover)
}

protocol HomePresentable: Presentable {
  var listener: HomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
  func present(covers: [Diary.Cover])
}

protocol HomeListener: class {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {
  
  weak var router: HomeRouting?
  weak var listener: HomeListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: HomePresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    
    presenter.present(covers: Diary.Cover.samples)
  }
  
  override func willResignActive() {
    super.willResignActive()
    // TODO: Pause any business logic.
  }
  
  func selectDiaryCover(atIndex: Int) {
    ()
  }
  
}
