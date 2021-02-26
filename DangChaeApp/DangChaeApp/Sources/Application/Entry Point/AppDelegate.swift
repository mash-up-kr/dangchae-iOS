//
//  AppDelegate.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/01/19.
//

import UIKit
import RIBs
import Then
import KakaoSDKAuth
import NaverThirdPartyLogin

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  private var launchRouter: LaunchRouting?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    configureRIBs()
    configureNaverAuth()
    return true
  }
  
  func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    //    let needsOpenURL = handleKakaoURL(with: url) ||
    print(url)
    return handleNaverURL(app, open: url, options: options)
    //    return needsOpenURL
  }
  
}

// MARK: Configuration
extension AppDelegate {
  private func configureRIBs() {
    let window = UIWindow()
    self.window = window
    let rootRouter = RootBuilder(dependency: AppComponent()).build()
    self.launchRouter = rootRouter
    rootRouter.launchFromWindow(window)
  }
  
  private func configureNaverAuth() {
    NaverThirdPartyLoginConnection.getSharedInstance().do {
      $0.serviceUrlScheme = kServiceAppUrlScheme
      $0.consumerKey = kConsumerKey
      $0.consumerSecret = kConsumerSecret
      $0.appName = kServiceAppName
      $0.isInAppOauthEnable = true
      $0.isNaverAppOauthEnable = true
    }
  }
  
  private func handleKakaoURL(with url: URL) -> Bool {
    guard AuthApi.isKakaoTalkLoginUrl(url) else { return false }
    return AuthController.handleOpenUrl(url: url)
  }
  
  private func handleNaverURL(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    guard let naverLogin = NaverThirdPartyLoginConnection.getSharedInstance() else { return false }
    return naverLogin.application(app, open: url, options: options)
  }
}
