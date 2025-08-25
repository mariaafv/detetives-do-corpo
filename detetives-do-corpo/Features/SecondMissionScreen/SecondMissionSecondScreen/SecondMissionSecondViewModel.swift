import Foundation

protocol SecondMissionSecondScreenViewModelProtocol: AnyObject {
  func didTapNextQuestion()
}

protocol SecondMissionSecondScreenNavigationDelegate: AnyObject {
  func goToSecondMissionThirdScreen()
}

class SecondMissionSecondScreenViewModel {
  private weak var navigationDelegate: SecondMissionSecondScreenNavigationDelegate?
  
  init(navigationDelegate: SecondMissionSecondScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension SecondMissionSecondScreenViewModel: SecondMissionSecondScreenViewModelProtocol {
  func didTapNextQuestion() {
    navigationDelegate?.goToSecondMissionThirdScreen()
  }
}
