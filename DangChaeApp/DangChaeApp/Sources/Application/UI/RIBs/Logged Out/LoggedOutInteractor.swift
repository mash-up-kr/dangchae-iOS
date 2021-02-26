//
//  LoggedOutInteractor.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
  var listener: LoggedOutPresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedOutListener: class {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedOutInteractor:
  PresentableInteractor<LoggedOutPresentable>,
  LoggedOutInteractable,
  LoggedOutPresentableListener
{
  weak var router: LoggedOutRouting?
  weak var listener: LoggedOutListener?
  
  private var disposeBag = DisposeBag()
  
  // MARK: 🏁 Initialization
  override init(presenter: LoggedOutPresentable) {
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
  
  func signIn(with provider: AuthProvider?) {
    guard let provider = provider else { return }
    
    Auth.of(provider)
      .authorize()
      .subscribe(onNext: { response in
        print(response.provider)
        print(response.accessToken)
      })
      .disposed(by: disposeBag)  }
}
