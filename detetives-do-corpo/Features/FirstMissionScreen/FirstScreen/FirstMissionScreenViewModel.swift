import Foundation

protocol FirstMissionScreenViewModelProtocol: AnyObject {
  func didTapNextQuestion()
}

protocol FirstMissionScreenNavigationDelegate: AnyObject {
  func nextQuestion()
}

class FirstMissionScreenViewModel {
  private weak var navigationDelegate: FirstMissionScreenNavigationDelegate?
  
  init(navigationDelegate: FirstMissionScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension FirstMissionScreenViewModel: FirstMissionScreenViewModelProtocol {
  func didTapNextQuestion() {
    navigationDelegate?.nextQuestion()
  }
}
