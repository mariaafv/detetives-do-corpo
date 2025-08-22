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
    let viewModel = FirstMissionThirdScreenViewModel(navigationDelegate: self)
    let viewController = FirstMissionThirdScreenViewController(viewModel: viewModel)
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
  func nextQuestion() {
    let viewModel = FirstMissionSecondScreenViewModel(navigationDelegate: self)
    let viewControler = FirstMissionSecondScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewControler, animated: true)
  }
}

extension Router: FirstMissionSecondScreenNavigationDelegate {
  func goToQuestion() {
    let viewModel = FirstMissionThirdScreenViewModel(navigationDelegate: self)
    let viewControler = FirstMissionThirdScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewControler, animated: true)
  }
}

extension Router: FirstMissionThirdScreenNavigationDelegate {
  func didTapFinished() {
      let viewModel = MissionFinishedViewModel(navigationDelegate: self)
      let viewController = MissionFinishedViewController(viewModel: viewModel)
      
    if let sheet = viewController.sheetPresentationController {
        sheet.detents = [
            .custom { _ in
                return viewController.view.systemLayoutSizeFitting(
                    CGSize(width: UIScreen.main.bounds.width, height: UIView.layoutFittingCompressedSize.height)
                ).height
            }
        ]
        sheet.prefersGrabberVisible = true
    }
      
      navigationController.present(viewController, animated: true)
  }

}

extension Router: MissionFinishedNavigationDelegate {
  //code
}
