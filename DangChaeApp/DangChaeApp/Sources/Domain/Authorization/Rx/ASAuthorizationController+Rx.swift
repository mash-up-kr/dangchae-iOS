//
//  ASAuthorizationController+Rx.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RxCocoa
import RxSwift
import AuthenticationServices


final class RxASAuthorizationControllerDelegateProxy:
  DelegateProxy<ASAuthorizationController, ASAuthorizationControllerDelegate>,
  DelegateProxyType,
  ASAuthorizationControllerDelegate
{
  static func registerKnownImplementations() {
    self.register {
      RxASAuthorizationControllerDelegateProxy(
        parentObject: $0,
        delegateProxy: RxASAuthorizationControllerDelegateProxy.self
      )
    }
  }
  
  static func currentDelegate(for object: ASAuthorizationController) -> ASAuthorizationControllerDelegate? {
    object.delegate
  }
  
  static func setCurrentDelegate(_ delegate: ASAuthorizationControllerDelegate?, to object: ASAuthorizationController) {
    object.delegate = delegate
  }
}

extension Reactive where Base: ASAuthorizationController {
  var delegate: DelegateProxy<ASAuthorizationController, ASAuthorizationControllerDelegate> {
    RxASAuthorizationControllerDelegateProxy.proxy(for: base)
  }
  
  var accessTokenDidLoad: Observable<String?> {
    delegate
      .methodInvoked(#selector(ASAuthorizationControllerDelegate.authorizationController(controller:didCompleteWithAuthorization:)))
      .map { parameters in
        guard let authorization = parameters[1] as? ASAuthorization,
              let credential = authorization.credential as? ASAuthorizationAppleIDCredential
        else { return nil }
        return credential.user
      }
  }
}
