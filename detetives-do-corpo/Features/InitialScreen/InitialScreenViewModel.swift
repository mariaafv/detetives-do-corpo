import Foundation

protocol InitialScreenViewModelProtocol: AnyObject {
  func didTapMissionsButton()
}

protocol InitialScreenNavigationDelegate: AnyObject {
  func didTapMissionsButton()
}

class InitialScreenViewModel {
  private weak var navigationDelegate: InitialScreenNavigationDelegate?
  
  init(navigationDelegate: InitialScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension InitialScreenViewModel: InitialScreenViewModelProtocol {
  func didTapMissionsButton() {
    navigationDelegate?.didTapMissionsButton()
  }
}
