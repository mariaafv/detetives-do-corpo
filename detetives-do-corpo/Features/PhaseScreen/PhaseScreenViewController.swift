import UIKit

class PhaseScreenViewController: UIViewController {
  private let baseView = PhaseScreenView()
  private let viewModel: PhaseScreenViewModelProtocol
  
  private var answerButtons: [CustomButton] {
    return [baseView.firstAnswerBallon, baseView.secondAnswerBallon, baseView.thirdAnswerBallon]
  }
  
  init(viewModel: PhaseScreenViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    self.view = baseView
    self.view.backgroundColor = .background
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupActions()
  }
  
  func setupViews() {
    baseView.phaseImageView.image = UIImage(named: viewModel.phaseImageName)
    baseView.historyBallon.buttonTitle = viewModel.phaseHistory
    baseView.firstAnswerBallon.buttonTitle = viewModel.phaseFirstBaloonText
    baseView.secondAnswerBallon.buttonTitle = viewModel.phaseSecondBaloonText
    baseView.thirdAnswerBallon.buttonTitle = viewModel.phaseThirdBaloonText
  }
  
  func setupActions() {
    baseView.firstAnswerBallon.addTarget(self, action: #selector(didTapFirstAnswer), for: .touchUpInside)
    baseView.secondAnswerBallon.addTarget(self, action: #selector(didTapSecondAnswer), for: .touchUpInside)
    baseView.thirdAnswerBallon.addTarget(self, action: #selector(didTapThirdAnswer), for: .touchUpInside)
  }
  
  @objc func didTapFirstAnswer() {
    configureAnswerColors()
    scheduleNextQuestion()
  }
  
  @objc func didTapSecondAnswer() {
    configureAnswerColors()
    scheduleNextQuestion()
  }
  
  @objc func didTapThirdAnswer() {
    configureAnswerColors()
    scheduleNextQuestion()
  }
  
  private func scheduleNextQuestion() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.viewModel.didTapNextQuestion()
    }
  }
  func configureAnswerColors() {
    let correctIndex = viewModel.correctAnswerIndex
    
    for (index, button) in answerButtons.enumerated() {
      if index == correctIndex {
        button.updateBackgroundColor(.buttonGreen)
      } else {
        button.updateBackgroundColor(.buttonRed)
      }
      button.isUserInteractionEnabled = false
    }
  }
}
