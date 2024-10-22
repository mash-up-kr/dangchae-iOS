//
//  AppleAuth.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RxSwift
import AuthenticationServices

final class AppleAuth: OAuth {
  
  func authorize() -> Observable<AuthResponse> {
    let request = ASAuthorizationAppleIDProvider().createRequest()
    let controller = ASAuthorizationController(authorizationRequests: [request])
    controller.performRequests()
    return controller.rx.accessTokenDidLoad
      .map { accessToken in
        guard let accessToken = accessToken else { throw Error.tokenDidNotFetched }
        return AuthResponse(provider: .apple, accessToken: accessToken)
      }
  }
  
  enum Error: LocalizedError {
    case tokenDidNotFetched
    
    var errorDescription: String? { "네이버와 연결을 실패했습니다." }
  }
}
