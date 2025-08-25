import UIKit

class MissionFinishedViewController: UIViewController {
  private let baseView = MissionFinishedView()
  private let viewModel: MissionFinishedViewModelProtocol
  
  init(viewModel: MissionFinishedViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    self.view = baseView
  }
  
  override func viewDidLoad() {
    baseView.backgroundColor = .background
    baseView.setBannerImage(viewModel.bannerImage)
    setupActions()
  }
  
  func setupActions() {
    baseView.returnButton.addTarget(self, action: #selector(handleReturnButtonTapped), for: .touchUpInside)
  }
  
  @objc func handleReturnButtonTapped() {
      dismiss(animated: true) {
          self.viewModel.backToMissionsScreen()
      }
  }

}
