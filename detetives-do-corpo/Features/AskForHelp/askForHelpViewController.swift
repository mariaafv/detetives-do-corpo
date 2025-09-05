import UIKit

class AskForHelpViewController: UIViewController {
  
  private let baseView = AskForHelpScreenView()
  private let viewModel: AskForHelpViewModelProtocol
  
  init(viewModel: AskForHelpViewModelProtocol) {
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
    configureCallCard()
  }
  
  func configureCallCard() {
    let gesture = UITapGestureRecognizer(target: self, action: #selector(callCard))
    baseView.cardUrgent.addGestureRecognizer(gesture)
  }
  
  @objc func callCard() {
    viewModel.makePhoneCall(toNumber: "100")
  }
}
