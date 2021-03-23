//
//  DiaryViewController.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/12.
//

import RIBs
import RxSwift
import UIKit

protocol DiaryPresentableListener: class {
  func close()
  func inviteMember()
  func changeDate()
  func changeDiarySetting()
}

final class DiaryViewController:
  UIViewController,
  DiaryPresentable,
  DiaryViewControllable,
  StoryboardBuildable
{
  
  typealias DataSource = UITableViewDiffableDataSource<Section, Diary.Page>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Diary.Page>
  enum Section {
    case pages
  }
    
  weak var listener: DiaryPresentableListener?
  private lazy var dataSource = makeDataSource()
  
  @IBOutlet private weak var diarysTableView: UITableView?
  @IBOutlet private weak var writeButton: UIButton?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  
  @IBAction private func backButtonDidTap(_ sender: Any) {
    listener?.close()
  }
  
  @IBAction private func inviteMemberButtonDidTap(_ sender: Any) {
    listener?.inviteMember()
  }
  
  @IBAction private func settingButtonDidTap(_ sender: Any) {
    listener?.changeDiarySetting()
  }
  
  @IBAction private func calendarViewDidTap(_ sender: Any) {
    listener?.changeDate()
  }
  
  func present(pages: [Diary.Page]) {
    var snapshot = Snapshot()
    snapshot.appendSections([.pages])
    snapshot.appendItems(pages)
    dataSource?.apply(snapshot)
  }
  
  private func configureUI() {
    if let writeButton = writeButton {
      view.bringSubviewToFront(writeButton)
    }
    configureTableView()
  }
  
  private func configureTableView() {
    diarysTableView?.dataSource = dataSource
    diarysTableView?.separatorStyle = .none
    diarysTableView?.rowHeight = UITableView.automaticDimension
    diarysTableView?.allowsSelection = false
    diarysTableView?.estimatedRowHeight = 150
  }
  
  private func makeDataSource() -> DataSource? {
    guard let tableView = diarysTableView else { return nil }
    return DataSource(tableView: tableView) { tableView, indexPath, page in
      let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryPageCell", for: indexPath) as! DiaryPageCell
      cell.configure(with: page)
      return cell
    }
  }
}
