import Foundation

protocol InitialScreenViewModelProtocol: AnyObject {
  func didTapMissionsButton()
}

protocol InititalScreenNavigationDelegate: AnyObject {
  func didTapMissionsButton()
}

class InitialScreenViewModel {
  private weak var navigationDelegate: InititalScreenNavigationDelegate?
  
  init(navigationDelegate: InititalScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension InitialScreenViewModel: InitialScreenViewModelProtocol {
  func didTapMissionsButton() {
    navigationDelegate?.didTapMissionsButton()
  }
}
