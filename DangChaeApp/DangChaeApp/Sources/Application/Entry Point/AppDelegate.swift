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
import KakaoSDKCommon
import NaverThirdPartyLogin

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  private var launchRouter: LaunchRouting?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    preview()
    //    configureRIBs()
    //    configureKakaoAuth()
    //    configureNaverAuth()
    return true
  }
  
  func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    //   return handleNaverURL(app, open: url, options: options)
    let needsOpenURL = handleKakaoURL(with: url) || handleNaverURL(app, open: url, options: options)
    return needsOpenURL
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
  
  private func configureKakaoAuth() {
    KakaoSDKCommon.initSDK(appKey: "066f8481f7118251d059e16284d42980")
  }
  
  private func configureNaverAuth() {
    NaverThirdPartyLoginConnection.getSharedInstance().do {
      $0.serviceUrlScheme = "udada"
      $0.consumerKey = kConsumerKey// "YO0yyr95i1heHnDJzci1"
      $0.consumerSecret = "fmVGBQUULp"
      $0.appName = "우다다"
      $0.isInAppOauthEnable = true
      $0.setOnlyPortraitSupportInIphone(true)
      $0.isNaverAppOauthEnable = false
    }
  }
  
  private func preview() {
    let pages = Diary.Page.samples
    let viewController = HomeViewController.instantiate()
    _ = viewController.view
    viewController.present(covers: Diary.Cover.samples)
    let window = UIWindow()
    window.rootViewController = viewController
    
    self.window = window
    window.makeKeyAndVisible()
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
