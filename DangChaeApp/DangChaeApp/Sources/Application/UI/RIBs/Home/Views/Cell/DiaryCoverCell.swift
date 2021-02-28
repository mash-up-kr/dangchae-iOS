//
//  DiaryCoverCellCollectionViewCell.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/28.
//

import UIKit

@IBDesignable
final class DiaryCoverCell: UICollectionViewCell {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    self.borderWidth = 1
    self.backgroundColor = .red
    self.borderColor = .black
    
    let number = [1,2,3].randomElement()!
    switch number {
    case 1: mask(with: pentagon1Points)
    // drawShape(with: pentagon1Points, color: .cyan)
    case 2: mask(with: pentagon2Points)
    // drawShape(with: pentagon2Points, color: .green)
    case 3: mask(with: pentagon3Points)
    // drawShape(with: pentagon3Points, color: .magenta)
    default: ()
    }
  }
  private func mask(with points: [CGPoint]) {
    var points = points
    guard !points.isEmpty else { return }
    let origin = points.removeFirst()
    
    let path = UIBezierPath()
    path.move(to: origin)
    points.forEach { path.addLine(to: $0) }
    path.close()
    
    let maskLayer = CAShapeLayer()
    maskLayer.path = path.cgPath
    maskLayer.fillRule = .evenOdd
    maskLayer.bounds = frame
    self.layer.mask = maskLayer
    //
    //    color.setFill()
    //    path.fill()
  }
  
  private func drawShape(with points: [CGPoint], color: UIColor) {
    var points = points
    guard !points.isEmpty else { return }
    let origin = points.removeFirst()
    
    let path = UIBezierPath()
    path.move(to: origin)
    points.forEach { path.addLine(to: $0) }
    path.close()
    
    color.setFill()
    path.fill()
  }
  
  private func x(percent: CGFloat) -> CGFloat {
    return (self.bounds.maxX - self.bounds.minX) * percent
  }
  
  private func y(percent: CGFloat) -> CGFloat {
    return (self.bounds.maxY - self.bounds.minY) * percent
  }
  
}
extension DiaryCoverCell {
  
  private var pentagon1Points: [CGPoint] {
    [CGPoint(x: x(percent: 0.8), y: y(percent: 0.0)),
     CGPoint(x: x(percent: 1.0), y: y(percent: 0.7)),
     CGPoint(x: x(percent: 0.6), y: y(percent: 1.0)),
     CGPoint(x: x(percent: 0.0), y: y(percent: 0.8)),
     CGPoint(x: x(percent: 0.05), y: y(percent: 0.2))]
  }
  
  
  private var pentagon2Points: [CGPoint] {
    [CGPoint(x: x(percent: 0.8), y: y(percent: 0.0)),
     CGPoint(x: x(percent: 1.0), y: y(percent: 0.3)),
     CGPoint(x: x(percent: 0.6), y: y(percent: 1.0)),
     CGPoint(x: x(percent: 0.0), y: y(percent: 0.8)),
     CGPoint(x: x(percent: 0.1), y: y(percent: 0.2))]
  }
  
  private var pentagon3Points: [CGPoint] {
    [CGPoint(x: x(percent: 0.45), y: y(percent: 0.0)),
     CGPoint(x: x(percent: 1.0), y: y(percent: 0.33)),
     CGPoint(x: x(percent: 0.9), y: y(percent: 0.9)),
     CGPoint(x: x(percent: 0.5), y: y(percent: 0.95)),
     CGPoint(x: x(percent: 0.1), y: y(percent: 0.4))]
  }
}
