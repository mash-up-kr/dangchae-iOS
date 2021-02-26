//
//  LoggedOutViewController.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/02/26.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: class {
  func signIn(with provider: AuthProvider?)
}

final class LoggedOutViewController:
  UIViewController,
  LoggedOutPresentable,
  LoggedOutViewControllable,
  StoryboardBuildable
{
  
  weak var listener: LoggedOutPresentableListener?
  
  // MARK: 🖼 UI
  @IBOutlet private weak var kakaoButton: UIButton?
  @IBOutlet private weak var naverButton: UIButton?
  @IBOutlet private weak var appleButton: UIButton?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func loginButtonDidTap(_ sender: UIButton) {
    listener?.signIn(with: provider(of: sender))
  }
  
  private func provider(of button: UIButton) -> AuthProvider? {
    switch button {
    case kakaoButton: return .kakao
    case naverButton: return .naver
    case appleButton: return .apple
    default: return nil
    }
  }
}