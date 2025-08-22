import Foundation

protocol FirstMissionThirdScreenViewModelProtocol: AnyObject {
  func didTapFinished()
}

protocol FirstMissionThirdScreenNavigationDelegate: AnyObject {
  func didTapFinished()
}

class FirstMissionThirdScreenViewModel {
  private weak var navigationDelegate: FirstMissionThirdScreenNavigationDelegate?
  
  init(navigationDelegate: FirstMissionThirdScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension FirstMissionThirdScreenViewModel: FirstMissionThirdScreenViewModelProtocol {
  func didTapFinished() {
    navigationDelegate?.didTapFinished()
  }
}
