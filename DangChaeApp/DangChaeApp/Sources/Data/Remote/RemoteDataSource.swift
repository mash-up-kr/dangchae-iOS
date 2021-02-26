//
//  Remote.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import Foundation
import RxSwift

protocol RemoteDataSource {
  func request<API: DangChaeAPI>(_ endpoint: API) -> Observable<API.Response>
}
