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
  func didTapMedalsButton() {
    let viewModel = MedalsViewModel()
    let viewController = MedalsViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
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
    let viewModel = SecondMissionFirstScreenViewModel(navigationDelegate: self)
    let viewController = SecondMissionFirstScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
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

extension Router: SecondMissionFirstScreenNavigationDelegate {
  func nextScreen() {
    let viewModel = SecondMissionSecondScreenViewModel(navigationDelegate: self)
    let viewController = SecondMissionSecondScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension Router: SecondMissionSecondScreenNavigationDelegate {
  func goToSecondMissionThirdScreen() {
    //code
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

