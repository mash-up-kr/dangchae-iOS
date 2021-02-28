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
  
}

final class HomeViewController:
  UIViewController,
  HomePresentable,
  HomeViewControllable,
  StoryboardBuildable
{
  weak var listener: HomePresentableListener?
  
  @IBOutlet private weak var userInfoView: UserHeaderView?
  @IBOutlet private weak var diaryInfoView: DiaryInfoHeaderView?
  @IBOutlet private weak var diarysCollectionView: UICollectionView?
  @IBOutlet private weak var diaryPageControl: UIPageControl?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    diarysCollectionView?.do {
      $0.dataSource = self
      $0.delegate = self
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  @IBAction func writeTodayDiaryButtonDidTap(_ sender: UIButton) {
  }
}
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return 10
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(
      withReuseIdentifier: "DiaryCoverCell",
      for: indexPath
    )
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
