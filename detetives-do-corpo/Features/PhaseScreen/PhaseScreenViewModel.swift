import Foundation

protocol PhaseScreenViewModelProtocol: AnyObject {
  func didTapNextQuestion()
  var phaseImageName: String { get set}
  var phaseHistory: String { get set}
  var phaseFirstBaloonText: String { get set}
  var phaseSecondBaloonText: String { get set}
  var phaseThirdBaloonText: String { get set}
  var correctAnswerIndex: Int { get }
}

protocol PhaseScreenNavigationDelegate: AnyObject {
  func nextQuestion()
}

class PhaseScreenViewModel: PhaseScreenViewModelProtocol {
  private weak var navigationDelegate: PhaseScreenNavigationDelegate?
  var phaseImageName: String
  var phaseHistory: String
  var phaseFirstBaloonText: String
  var phaseSecondBaloonText: String
  var phaseThirdBaloonText: String
  var correctAnswerIndex: Int
  
  init(navigationDelegate: PhaseScreenNavigationDelegate?,
       phaseImageName: String,
       phaseHistory: String,
       phaseFirstBaloonText: String,
       phaseSecondBaloonText: String,
       phaseThirdBaloonText: String,
       correctAnswerIndex: Int) {
    self.navigationDelegate = navigationDelegate
    self.phaseImageName = phaseImageName
    self.phaseHistory = phaseHistory
    self.phaseFirstBaloonText = phaseFirstBaloonText
    self.phaseSecondBaloonText = phaseSecondBaloonText
    self.phaseThirdBaloonText = phaseThirdBaloonText
    self.correctAnswerIndex = correctAnswerIndex
  }
  
  func didTapNextQuestion() {
    navigationDelegate?.nextQuestion()
  }
}
