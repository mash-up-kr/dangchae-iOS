//
//  AppDelegate.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/01/19.
//

import UIKit
import RIBs
import Then

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var launchRouter: LaunchRouting?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    configureRIBs()
    configureNaverAuth()
    return true
  }
  
  private func configureRIBs() {
    let window = UIWindow()
    self.window = window
    let rootRouter = RootBuilder(dependency: AppComponent()).build()
    self.launchRouter = rootRouter
    rootRouter.launchFromWindow(window)
  }
  
  func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    return handleKakaoURL(with: url)
  }
  
}

import NaverThirdPartyLogin
extension AppDelegate {
  private func configureNaverAuth() {
    NaverThirdPartyLoginConnection.getSharedInstance().do {
      $0.serviceUrlScheme = kServiceAppUrlScheme
      $0.consumerKey = kConsumerKey
      $0.consumerSecret = kConsumerSecret
      $0.appName = kServiceAppName
    }
  }
}

import KakaoSDKAuth
extension AppDelegate {
  private func handleKakaoURL(with url: URL) -> Bool {
    guard AuthApi.isKakaoTalkLoginUrl(url) else { return false }
    return AuthController.handleOpenUrl(url: url)
  }
}
