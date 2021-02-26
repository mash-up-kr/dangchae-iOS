//
//  AppleAuth.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RxSwift
import KakaoSDKAuth

final class AppleAuth: OAuth {
  func authorize() -> Observable<AuthResponse> {
    return .empty()
  }
}
