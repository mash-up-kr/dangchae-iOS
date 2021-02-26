//
//  KakaoAuth.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RxSwift
import KakaoSDKAuth
import KakaoSDKUser

final class KakaoAuth: OAuth {
  func authorize() -> Observable<AuthResponse> {
    Observable<AuthResponse>.create { observer in
      guard AuthApi.isKakaoTalkLoginAvailable() else {
        observer.onError(Error.kakaotalkIsNotAvailable)
        return Disposables.create()
      }
      AuthApi.shared.loginWithKakaoTalk { (oauthToken, error) in
        if let error = error {
          observer.onError(error)
          return
        }
        if let oauthToken = oauthToken {
          let response = AuthResponse(provider: .kakao, accessToken: oauthToken.accessToken)
          observer.onNext(response)
          observer.onCompleted()
          return
        }
      }
      return Disposables.create()
    }
  }
  
  enum Error: LocalizedError {
    case kakaotalkIsNotAvailable
    
    var errorDescription: String? { "카카오톡 이용이 불가능합니다." }
  }
}
