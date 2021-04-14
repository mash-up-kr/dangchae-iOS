//
//  HomeViewController.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/27.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
  func selectDiaryCover(atIndex: Int)
}
final class HomeViewController:
  UIViewController,
  HomePresentable,
  HomeViewControllable,
  StoryboardBuildable
{
  
  typealias DataSource = UICollectionViewDiffableDataSource<Section, Diary.Cover>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Diary.Cover>
  enum Section {
    case diarys
  }
  
  weak var listener: HomePresentableListener?
  private lazy var dataSource = makeDataSource()
  
  // MARK: 🖼 UI
  @IBOutlet private weak var userInfoView: UserHeaderView?
  @IBOutlet private weak var diaryInfoView: DiaryInfoHeaderView?
  @IBOutlet private weak var diarysCollectionView: UICollectionView?
  @IBOutlet private weak var diaryPageControl: UIPageControl?
  @IBOutlet private weak var addNewDiaryLabel: UILabel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    diarysCollectionView?.delegate = self
    configureCollectionViewLayout()
  }
  
  // MARK: -  🥊 Action
  @IBAction private func writeTodayDiaryButtonDidTap(_ sender: UIButton) {
    
  }
  
  // MARK: - 📐 Layout
  private func configureCollectionViewLayout() {
    guard let layout = diarysCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
    let padding = (UIScreen.main.bounds.width - 250) / 2
    layout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: -padding)
    layout.minimumLineSpacing = 20
    layout.minimumInteritemSpacing = (UIScreen.main.bounds.width - 250) / 2
    diarysCollectionView?.decelerationRate = .fast
    diarysCollectionView?.isPagingEnabled = false
  }
  
  // MARK: - 🎨 Present
  func present(covers: [Diary.Cover]) {
    diaryPageControl?.numberOfPages = covers.count
    updateCollectionItems(with: covers)
  }
  
  private func updateCollectionItems(with covers: [Diary.Cover]) {
    var snapshot = Snapshot()
    snapshot.appendSections([.diarys])
    snapshot.appendItems(covers)
    dataSource?.apply(snapshot)
  }
  
  // MARK: - 💽 DataSource
  private func makeDataSource() -> DataSource? {
    guard let collectionView = diarysCollectionView else { return nil }
    return DataSource(
      collectionView: collectionView,
      cellProvider: { (collectionView, indexPath, diaryCover) in
        let cell = collectionView.dequeueReusableCell(type: DiaryCoverCell.self, indexPath: indexPath)
        cell.configure(with: diaryCover)
        return cell
      }
    )
  }
}
// MARK: - 🧩 Carousel
extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    listener?.selectDiaryCover(atIndex: indexPath.row)
  }
  
  func scrollViewWillEndDragging(
    _ scrollView: UIScrollView,
    withVelocity velocity: CGPoint,
    targetContentOffset: UnsafeMutablePointer<CGPoint>
  ) {
    guard let layout = self.diarysCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
    let cellWidthIncludingSpacing = layout.itemSize.width * 2 + layout.minimumLineSpacing
    let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
    let index: Int
    if velocity.x > 0 {
      index = Int(ceil(estimatedIndex))
    } else if velocity.x < 0 {
      index = Int(floor(estimatedIndex))
    } else {
      index = Int(round(estimatedIndex))
    }
    let pointToMove = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 100)
    targetContentOffset.pointee = pointToMove
    updatePageControl()
  }
  
  private func updatePageControl() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
      guard let self = self else { return }
      guard let collectionView = self.diarysCollectionView else { return }
      let center = self.view.convert(collectionView.center, to: collectionView)
      if let indexPath = self.diarysCollectionView?.indexPathForItem(at: center) {
        self.diaryPageControl?.currentPage = indexPath.item
      }
    }
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: 250, height: 250)
  }
  
}

extension Array {
  subscript(safe index: Int) -> Element? {
    guard self.count < index else { return nil }
    return self[index]
  }
}
