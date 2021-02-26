//
//  AppComponenet.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import Foundation
import RIBs

final class AppComponent: Component<EmptyDependency>, RootDependency {
  init() {
    super.init(dependency: EmptyComponent())
  }
}
