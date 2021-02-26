//
//  Autorization.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RxSwift

protocol OAuth {
  func authorize() -> Observable<AuthResponse>
}

enum Auth {
  static func of(_ provider: AuthProvider) -> OAuth {
    switch provider {
    case .kakao: return KakaoAuth()
    case .naver: return NaverAuth()
    case .apple: return AppleAuth()
    }
  }
}
