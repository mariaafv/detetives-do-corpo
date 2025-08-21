import Foundation
import UIKit

protocol MissionsRouterProtocol: AnyObject {
  func navigateToFirstMission()
  func navigateToSecondMission()
  func navigateToThirdMission()
  func navigateToFourthMission()
}

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
    let viewModel = MissionsScreenViewModel(router: self)
    let viewControler = MissionsScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewControler, animated: true)
  }
}

extension Router: MissionsRouterProtocol {
  func navigateToFirstMission() {
    let viewModel = FirstMissionScreenViewModel(navigationDelegate: self)
    let viewControler = FirstMissionScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewControler, animated: true)
  }
  
  func navigateToSecondMission() {
    //code
  }
  
  func navigateToThirdMission() {
    //code
  }
  
  func navigateToFourthMission() {
    //code
  }
}

extension Router: FirstMissionScreenNavigationDelegate {
  //code
}
