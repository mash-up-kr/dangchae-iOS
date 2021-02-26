//
//  AppDelegate.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/01/19.
//

import UIKit
import RIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var launchRouter: LaunchRouting?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    configureRIBs()
    return true
  }
  
  private func configureRIBs() {
    let window = UIWindow()
    self.window = window
    let rootRouter = RootBuilder(dependency: AppComponent()).build()
    self.launchRouter = rootRouter
    rootRouter.launchFromWindow(window)
  }
}

