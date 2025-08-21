import Foundation

protocol FirstMissionThirdScreenViewModelProtocol: AnyObject {
  func didTapNextQuestion()
}

protocol FirstMissionThirdScreenNavigationDelegate: AnyObject {
  func goToNextQuestion()
}

class FirstMissionThirdScreenViewModel {
  private weak var navigationDelegate: FirstMissionThirdScreenNavigationDelegate?
  
  init(navigationDelegate: FirstMissionThirdScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension FirstMissionThirdScreenViewModel: FirstMissionThirdScreenViewModelProtocol {
  func didTapNextQuestion() {
   // ir para uma tela de sucesso
  }
}
