import Foundation
import UIKit

final class Router {
  let navigationController: UINavigationController
  
  init() {
    self.navigationController = UINavigationController()
  }
  
  func start() {
    let viewModel = InitialScreenViewModel(navigationDelegate: self)
    let viewController = InitialScreenViewController(viewModel: viewModel)
    navigationController.viewControllers = [viewController]
  }
}


extension Router: InitialScreenNavigationDelegate {
  func didTapMissionsButton() {
    let viewModel = MissionsScreenViewModel(navigationDelegate: self)
    let viewControler = MissionsScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewControler, animated: true)
  }
}

extension Router: MissionsScreenNavigationDelegate {
  func didTapFirstMission() {
    let viewModel = FirstMissionScreenViewModel(navigationDelegate: self)
    let viewControler = FirstMissionScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewControler, animated: true)
  }
}

extension Router: FirstMissionScreenNavigationDelegate {
  //code
}
