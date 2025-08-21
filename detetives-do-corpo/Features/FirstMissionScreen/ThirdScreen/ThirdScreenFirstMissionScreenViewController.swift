import UIKit

class FirstMissionThirdScreenViewController: UIViewController {
  private let baseView = FirstMissionThirdScreenView()
  private let viewModel: FirstMissionThirdScreenViewModelProtocol
  
  init(viewModel: FirstMissionThirdScreenViewModelProtocol) {
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
    setupActions()
  }
  
  func setupActions() {
    baseView.firstAnswerBallon.addTarget(self, action: #selector(didTapFirstAnswer), for: UIControl.Event.touchUpInside)
    baseView.secondAnswerBallon.addTarget(self, action: #selector(didTapSecondAnswer), for: UIControl.Event.touchUpInside)
    baseView.thirdAnswerBallon.addTarget(self, action: #selector(didTapThirdAnswer), for: UIControl.Event.touchUpInside)
  }
  
  @objc func didTapFirstAnswer() {
    configureAnswerColors()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.viewModel.didTapNextQuestion()
    }
  }
  
  @objc func didTapSecondAnswer() {
    configureAnswerColors()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.viewModel.didTapNextQuestion()
    }
  }
  
  @objc func didTapThirdAnswer() {
    configureAnswerColors()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.viewModel.didTapNextQuestion()
    }
  }
  
  func configureAnswerColors() {
    baseView.firstAnswerBallon.updateBackgroundColor(.buttonGreen)
    baseView.secondAnswerBallon.updateBackgroundColor(.buttonRed)
    baseView.thirdAnswerBallon.updateBackgroundColor(.buttonRed)
  }
}
