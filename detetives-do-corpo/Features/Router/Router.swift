import Foundation
import UIKit



protocol MissionsRouterProtocol: AnyObject {
  func navigateToFirstMission()
  func navigateToSecondMission()
  func navigateToThirdMission()
  func navigateToFourthMission()
  func showMissionFinishedBottomSheet(image: String, description: String, missionIndex: Int, missionsViewModel: MissionsScreenViewModelProtocol)
}

final class Router {
  let navigationController: UINavigationController
  
  private let missionData = MissionPhase()
  private var currentMissionIndex: Int = 0
  private var currentPhaseIndex: Int = 0
  
  private weak var missionsViewModel: MissionsScreenViewModelProtocol?
  
  init() {
    self.navigationController = CustomNavigationController()
  }
  
  func start() {
    let viewModel = InitialScreenViewModel(navigationDelegate: self)
    let viewController = InitialScreenViewController(viewModel: viewModel)
    navigationController.viewControllers = [viewController]
  }
  
  private func navigateToMission(index: Int) {
    self.currentMissionIndex = index - 1
    self.currentPhaseIndex = 0
    showCurrentPhase()
  }
  
  private func showCurrentPhase() {
    let mission = missionData.missions[currentMissionIndex]
    let phase = mission.phases[currentPhaseIndex]
    
    let viewModel = PhaseScreenViewModel(
      navigationDelegate: self,
      phaseImageName: phase.imageName,
      phaseHistory: phase.history,
      phaseFirstBaloonText: phase.answers[0],
      phaseSecondBaloonText: phase.answers[1],
      phaseThirdBaloonText: phase.answers[2],
      correctAnswerIndex: phase.correctAnwserIndex
    )
    
    let viewController = PhaseScreenViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
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
    self.missionsViewModel = viewModel
    let viewController = MissionsScreenViewController(viewModel: viewModel, router: self)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension Router: MissionsRouterProtocol {
  func navigateToFirstMission() { navigateToMission(index: 1) }
  func navigateToSecondMission() { navigateToMission(index: 2) }
  func navigateToThirdMission() { navigateToMission(index: 3) }
  func navigateToFourthMission() { navigateToMission(index: 4) }
}

extension Router: PhaseScreenNavigationDelegate {
  func nextQuestion() {
    currentPhaseIndex += 1
    
    let currentMission = missionData.missions[currentMissionIndex]
    
    if currentPhaseIndex < currentMission.phases.count {
      showCurrentPhase()
    } else {
      guard let missionsViewModel = self.missionsViewModel else { return }
      
      showMissionFinishedBottomSheet(
        image: currentMission.conquestImageName,
        description: currentMission.medalDescription,
        missionIndex: self.currentMissionIndex + 1,
        missionsViewModel: missionsViewModel
      )
    }
  }
}

extension Router: MissionFinishedNavigationDelegate {
  func backToMissionsScreen() {
    navigationController.dismiss(animated: true) {
      if let missionsVC = self.navigationController.viewControllers.first(where: { $0 is MissionsScreenViewController }) {
        self.navigationController.popToViewController(missionsVC, animated: true)
        NotificationCenter.default.post(name: .missionsUpdated, object: nil)
      }
    }
  }
}

extension Router {
  func showMissionFinishedBottomSheet(image: String, description: String, missionIndex: Int, missionsViewModel: MissionsScreenViewModelProtocol) {
    let viewModel = MissionFinishedViewModel(navigationDelegate: self,
                                             bannerImage: UIImage(named: image),
                                             medalDescription: description,
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

