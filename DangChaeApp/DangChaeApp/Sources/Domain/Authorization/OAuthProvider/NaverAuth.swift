//
//  NaverAuth.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RxSwift
import NaverThirdPartyLogin

final class NaverAuth: NSObject, OAuth {
  func authorize() -> Observable<AuthResponse> {
    NaverThirdPartyLoginConnection.getSharedInstance()?.requestThirdPartyLogin()
    return .empty()
  }
}
extension NaverAuth: NaverThirdPartyLoginConnectionDelegate {
  func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
    ()
  }
  
  func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
    ()
  }
  
  func oauth20ConnectionDidFinishDeleteToken() {
    ()
  }
  
  func oauth20Connection(
    _ oauthConnection: NaverThirdPartyLoginConnection!,
    didFailWithError error: Error!
  ) {
    ()
  }
}
