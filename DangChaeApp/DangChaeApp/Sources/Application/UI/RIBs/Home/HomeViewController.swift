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
    
    configureCollectionViewLayout()
  }
  
  // MARK: 🔫 Actions
  @IBAction private func writeTodayDiaryButtonDidTap(_ sender: UIButton) {
    
  }
  
  // MARK: 📐 Layout
  private func configureCollectionViewLayout() {
    guard let layout = diarysCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
    layout.itemSize = CGSize(width: 250, height: 250)
    diarysCollectionView?.collectionViewLayout = layout
  }
  
  func present(covers: [Diary.Cover]) {
    var snapshot = Snapshot()
    snapshot.appendSections([.diarys])
    snapshot.appendItems(covers)
    dataSource?.apply(snapshot)
  }
  
  // MARK: 💽 DataSource
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
extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    listener?.selectDiaryCover(atIndex: indexPath.row)
  }
}

extension Array {
  subscript(safe index: Int) -> Element? {
    guard self.count < index else { return nil }
    return self[index]
  }
}
