import UIKit

class FirstMissionScreenViewController: UIViewController {
  private let baseView = FirstMissionScreenView()
  private let viewModel: FirstMissionScreenViewModelProtocol
  
  init(viewModel: FirstMissionScreenViewModelProtocol) {
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
  }
}
