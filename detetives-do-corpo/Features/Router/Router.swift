import Foundation
import UIKit

protocol MissionsRouterProtocol: AnyObject {
  func navigateToFirstMission()
  func navigateToSecondMission()
  func navigateToThirdMission()
  func navigateToFourthMission()
  func showMissionFinishedBottomSheet(image: String, missionIndex: Int, missionsViewModel: MissionsScreenViewModelProtocol)
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
    let viewController = MissionsScreenViewController(viewModel: viewModel, router: self)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension Router: MissionsRouterProtocol {
  func navigateToFirstMission() {
    let viewModel = FirstMissionScreenViewModel(navigationDelegate: self)
    let viewController = FirstMissionScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  func navigateToSecondMission() {
    // implementar
  }
  
  func navigateToThirdMission() {
    // implementar
  }
  
  func navigateToFourthMission() {
    // implementar
  }
}

extension Router: FirstMissionScreenNavigationDelegate {
  func nextQuestion() {
    let viewModel = FirstMissionSecondScreenViewModel(navigationDelegate: self)
    let viewController = FirstMissionSecondScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension Router: FirstMissionSecondScreenNavigationDelegate {
  func goToQuestion() {
    let viewModel = FirstMissionThirdScreenViewModel(navigationDelegate: self)
    let viewController = FirstMissionThirdScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension Router: FirstMissionThirdScreenNavigationDelegate {
  func didTapFinished() {
    if let missionsViewController = navigationController.viewControllers.first(where: { $0 is MissionsScreenViewController }) as? MissionsScreenViewController {
      showMissionFinishedBottomSheet(image: "medal1", missionIndex: 0, missionsViewModel: missionsViewController.viewModel)
    }
  }
}

extension Router: MissionFinishedNavigationDelegate {
  func backToMissionsScreen() {
    navigationController.dismiss(animated: true) {
      NotificationCenter.default.post(name: .missionsUpdated, object: nil)
    }
    
    let viewModel = MissionsScreenViewModel(router: self)
    let viewController = MissionsScreenViewController(viewModel: viewModel, router: self)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension Router {
  func showMissionFinishedBottomSheet(image: String, missionIndex: Int, missionsViewModel: MissionsScreenViewModelProtocol) {
    let viewModel = MissionFinishedViewModel(navigationDelegate: self,
                                             bannerImage: UIImage(named: image),
                                             missionsViewModel: missionsViewModel,
                                             missionIndex: missionIndex)
    
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

