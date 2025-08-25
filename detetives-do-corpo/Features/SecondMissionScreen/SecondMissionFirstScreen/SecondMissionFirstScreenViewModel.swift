import Foundation

protocol SecondMissionFirstScreenViewModelProtocol: AnyObject {
  func didTapNextQuestion()
}

protocol SecondMissionFirstScreenNavigationDelegate: AnyObject {
  func nextScreen()
}

class SecondMissionFirstScreenViewModel {
  private weak var navigationDelegate: SecondMissionFirstScreenNavigationDelegate?
  
  init(navigationDelegate: SecondMissionFirstScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension SecondMissionFirstScreenViewModel: SecondMissionFirstScreenViewModelProtocol {
  func didTapNextQuestion() {
    navigationDelegate?.nextScreen()
  }
}
