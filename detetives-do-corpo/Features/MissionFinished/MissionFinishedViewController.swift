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
  }
}
