//
//  RootInteractor.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs
import RxSwift

protocol RootRouting: LaunchRouting {
  func routeToLoggedOut()
  func routeToLoggedIn()
}

protocol RootPresentable: Presentable {
  var listener: RootPresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: class {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor:
  PresentableInteractor<RootPresentable>,
  RootInteractable,
  RootPresentableListener
{
  weak var router: RootRouting?
  weak var listener: RootListener?
  
  // MARK: 🏁 Initialization
  override init(presenter: RootPresentable) {
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
  
  func successAuth(with response: AuthResponse) {
    
  }
  
}
