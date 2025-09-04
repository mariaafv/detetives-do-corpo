import Foundation

protocol AskForHelpViewModelProtocol: AnyObject {
  func didTapMissionsButton()
  func didTapMedalsButton()
}

protocol AskForHelpNavigationDelegate: AnyObject {
  func didTapMissionsButton()
  func didTapMedalsButton()
}

class AskForHelpViewModel {
  private weak var navigationDelegate: AskForHelpNavigationDelegate?
  
  init(navigationDelegate: AskForHelpNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension AskForHelpViewModel: AskForHelpViewModelProtocol {
  func didTapMissionsButton() {
    navigationDelegate?.didTapMissionsButton()
  }
  
  func didTapMedalsButton() {
    navigationDelegate?.didTapMedalsButton()
  }
}
