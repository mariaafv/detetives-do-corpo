import Foundation
import UIKit

final class Router {
  let navigationDelegate: UINavigationController?
  
  init(navigationDelegate: UINavigationController? = nil) {
    self.navigationDelegate = navigationDelegate
  }
  
  func start() -> UIViewController {
    let viewModel = InitialScreenViewModel(navigationDelegate: self)
    let viewController = InitialScreenViewController(viewModel: viewModel)
    return viewController
  }
}

extension Router: InititalScreenNavigationDelegate {
  func didTapMissionsButton() {
    //code
  }
}
