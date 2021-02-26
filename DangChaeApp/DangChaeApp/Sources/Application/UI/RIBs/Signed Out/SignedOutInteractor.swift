//
//  LoggedOutInteractor.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs
import RxSwift

protocol SignedOutRouting: ViewableRouting {
}

protocol SignedOutPresentable: Presentable {
  var listener: SignedOutPresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SignedOutListener: class {
  func successAuth(with response: AuthResponse)
}

final class SignedOutInteractor:
  PresentableInteractor<SignedOutPresentable>,
  SignedOutInteractable,
  SignedOutPresentableListener
{
  weak var router: SignedOutRouting?
  weak var listener: SignedOutListener?
  
  private var disposeBag = DisposeBag()
  
  // MARK: 🏁 Initialization
  override init(presenter: SignedOutPresentable) {
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
    Logger.log("\(provider)로 로그인 시도")
    
    Auth.of(provider)
      .authorize()
      .subscribe(onNext: { response in
        Logger.log("🔐==================================\n\(response.provider)\n\(response.accessToken)\n==================================")
      })
      .disposed(by: disposeBag)
  }
}
