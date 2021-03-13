//
//  NaverThirdPartyLoginConnection+Rx.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RxCocoa
import RxSwift
import NaverThirdPartyLogin

final class RxNaverThirdPartyLoginConnectionProxy
: DelegateProxy<NaverThirdPartyLoginConnection, NaverThirdPartyLoginConnectionDelegate>,
  DelegateProxyType,
  NaverThirdPartyLoginConnectionDelegate
{
  func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
    
  }
  
  func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
    
  }
  
  func oauth20ConnectionDidFinishDeleteToken() {
    
  }
  
  func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
    
  }
  
  public private(set) weak var naverLogin: NaverThirdPartyLoginConnection?
  
  public init(parentObject: ParentObject) {
    self.naverLogin = parentObject
    super.init(
      parentObject: parentObject,
      delegateProxy: RxNaverThirdPartyLoginConnectionProxy.self
    )
  }
  
  static func registerKnownImplementations() {
    self.register { RxNaverThirdPartyLoginConnectionProxy(parentObject: $0) }
  }
  
  static func currentDelegate(for object: NaverThirdPartyLoginConnection) -> NaverThirdPartyLoginConnectionDelegate? {
    object.delegate
  }
  
  static func setCurrentDelegate(_ delegate: NaverThirdPartyLoginConnectionDelegate?, to object: NaverThirdPartyLoginConnection) {
    object.delegate = delegate
  }
}

extension Reactive where Base: NaverThirdPartyLoginConnection {
  var delegate: DelegateProxy<NaverThirdPartyLoginConnection, NaverThirdPartyLoginConnectionDelegate> {
    RxNaverThirdPartyLoginConnectionProxy.proxy(for: base)
  }
  
  var accessTokenDidLoad: Observable<String?> {
    delegate
      .methodInvoked(#selector(NaverThirdPartyLoginConnectionDelegate.oauth20ConnectionDidFinishRequestACTokenWithAuthCode))
      .map { _ in return NaverThirdPartyLoginConnection.getSharedInstance()?.accessToken }
    
  }
}
