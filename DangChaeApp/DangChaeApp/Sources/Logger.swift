//
//  Logger.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import Foundation

enum Logger {
  enum Level: CustomDebugStringConvertible {
    case error
    case warning
    case info
    case debug
    case unknown
    
    var debugDescription: String {
      switch self {
      case .error: return "❤️ ERROR"
      case .warning: return "💛 WARNING"
      case .info: return "💙 INFO"
      case .debug: return "💚 DEBUG"
      case .unknown: return "☠️ UNKNOWN"
      }
    }
  }
  
  static func log<T>(
    _ object: @autoclosure () -> T,
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line,
    level: Level = .info
  ) {
    #if DEBUG
    let value: T = object()
    let fileURL: String = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
    let queue: String = Thread.isMainThread ? "UI" : "BG"
    
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    
    print("\(level.debugDescription) <\(formatter.string(from: Date()))> <\(queue)> \(fileURL) \(function)[\(line)]: " + String(reflecting: value))
    #endif
  }
}
