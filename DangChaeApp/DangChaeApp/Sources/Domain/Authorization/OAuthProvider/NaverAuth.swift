//
//  NaverAuth.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RxSwift
import RxCocoa
import NaverThirdPartyLogin

final class NaverAuth: NSObject, OAuth {
  
  private var response = PublishSubject<AuthResponse>()
  
  func authorize() -> Observable<AuthResponse> {
    // 이미 유효한 토큰이 있다면 가져오기
    if let accessToken = vaildAccessToken() { return .just(AuthResponse(provider: .naver, accessToken: accessToken)) }
    
    guard let naverLogin = NaverThirdPartyLoginConnection.getSharedInstance() else { return .error(Error.naverIsNotConnected) }
    naverLogin.requestThirdPartyLogin()
    return naverLogin.rx.accessTokenDidLoad
      .map { accessToken in
        guard let accessToken = accessToken else { throw Error.tokenDidNotFetched }
        return AuthResponse(provider: .naver, accessToken: accessToken)
      }
  }
  
  private func vaildAccessToken() -> String? {
    guard let naverLogin = NaverThirdPartyLoginConnection.getSharedInstance(),
          naverLogin.isValidAccessTokenExpireTimeNow()
    else { return nil }
    return naverLogin.accessToken
  }
  
  enum Error: LocalizedError {
    case naverIsNotConnected
    case tokenDidNotFetched
    
    var errorDescription: String? { "네이버와 연결을 실패했습니다." }
  }
}
