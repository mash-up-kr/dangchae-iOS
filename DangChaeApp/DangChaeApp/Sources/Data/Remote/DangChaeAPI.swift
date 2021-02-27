//
//  DangChaeAPI.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import Foundation
import MoyaSugar

protocol DangChaeAPI: SugarTargetType {
  associatedtype Response: Decodable
}
