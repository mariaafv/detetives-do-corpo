import Foundation

protocol InitialScreenViewModelProtocol: AnyObject {
  func didTapMissionsButton()
  func didTapMedalsButton()
  func didTapAskForHelpButton()
}

protocol InitialScreenNavigationDelegate: AnyObject {
  func didTapMissionsButton()
  func didTapMedalsButton()
  func didTapAskForHelpButton()
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
  
  func didTapMedalsButton() {
    navigationDelegate?.didTapMedalsButton()
  }
  
  func didTapAskForHelpButton() {
    navigationDelegate?.didTapAskForHelpButton()
  }
}
