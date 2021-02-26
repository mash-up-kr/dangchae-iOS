//
//  HTTPClients.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import Moya
import RxSwift

final class HTTPClient: RemoteDataSource {
  
  static let shared = HTTPClient()
  
  private let provider = MoyaProvider<MultiTarget>()
  private let decoder = JSONDecoder()
  
  func request<API: DangChaeAPI>(_ endpoint: API) -> Observable<API.Response> {
    let api = MultiTarget(endpoint)
    return Observable<API.Response>.create { [weak self] observer in
      self?.provider.request(api) { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .success(let body):
          do {
            let response = try self.decoder.decode(API.Response.self, from: body.data)
            observer.onNext(response)
            observer.onCompleted()
          } catch let error {
            observer.onError(error)
          }
          
        case .failure(let error):
          observer.onError(error)
        }
      }
      return Disposables.create()
    }
  }
}

protocol DangChaeAPI: TargetType {
  associatedtype Response: Decodable
}
