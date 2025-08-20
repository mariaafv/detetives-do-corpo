import UIKit

class InitialScreenViewController: UIViewController {
  
  private let baseView = InitialScreenView()
  private let viewModel: InitialScreenViewModelProtocol
  
  init(viewModel: InitialScreenViewModelProtocol) {
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
    baseView.missionsButton.addTarget(self, action: #selector(missionsButtonTapped), for: .touchUpInside)
  }
  
  @objc func missionsButtonTapped() {
    viewModel.didTapMissionsButton()
  }
}
