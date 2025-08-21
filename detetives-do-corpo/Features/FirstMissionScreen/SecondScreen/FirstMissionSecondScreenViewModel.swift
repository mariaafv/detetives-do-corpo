import Foundation

protocol FirstMissionSecondScreenViewModelProtocol: AnyObject {
  func didTapNextQuestion()
}

protocol FirstMissionSecondScreenNavigationDelegate: AnyObject {
  func goToQuestion()
}

class FirstMissionSecondScreenViewModel {
  private weak var navigationDelegate: FirstMissionSecondScreenNavigationDelegate?
  
  init(navigationDelegate: FirstMissionSecondScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension FirstMissionSecondScreenViewModel: FirstMissionSecondScreenViewModelProtocol {
  func didTapNextQuestion() {
    navigationDelegate?.goToQuestion()
  }
}
