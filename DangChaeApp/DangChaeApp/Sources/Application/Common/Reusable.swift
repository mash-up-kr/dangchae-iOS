//
//  Reusable.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/02.
//

import UIKit

protocol Reusable {
  static var reuseIdentifier: String { get }
}
extension Reusable {
  static var reuseIdentifier: String { String(describing: self) }
}

extension UITableView {
  func register<Cell: UITableViewCell & Reusable>(type: Cell.Type) {
    self.register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
  }
  
  func dequeueReusableCell<Cell: UITableViewCell & Reusable>(type: Cell.Type, indexPath: IndexPath) -> Cell {
    return self.dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as! Cell
  }
}

extension UICollectionView {
  func register<Cell: UICollectionViewCell & Reusable>(type: Cell.Type) {
    self.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
  }
  
  
  func dequeueReusableCell<Cell: UICollectionViewCell & Reusable>(type: Cell.Type, indexPath: IndexPath) -> Cell {
    return self.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
  }
}
