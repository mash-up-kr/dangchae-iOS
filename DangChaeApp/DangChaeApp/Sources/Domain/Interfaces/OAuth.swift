//
//  Autorization.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RxSwift

struct OAuthResult {
  let provider: String
  let accessToken: String
}

protocol OAuth {
  func authorize() -> Observable<OAuthResult>
}
