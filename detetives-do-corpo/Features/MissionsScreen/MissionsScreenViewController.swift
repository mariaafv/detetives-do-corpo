import UIKit

class MissionsScreenViewController: UIViewController {
  private let baseView = MissionsScreenView()
  private let viewModel: MissionsScreenViewModelProtocol
  
  init(viewModel: MissionsScreenViewModelProtocol) {
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
    baseView.firstMissionButton.addTarget(self, action: #selector(didTapFirstMission), for: UIControl.Event.touchUpInside)
  }
  
  @objc func didTapFirstMission() {
    viewModel.didTapFirstMission()
  }
}
