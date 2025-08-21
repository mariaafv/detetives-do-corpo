import UIKit

protocol MissionsScreenViewModelProtocol: AnyObject {
  var missions: [Mission] { get }
  
  func markMissionsCompleted(at index: Int)
  func canNavigateToMission(at index: Int) -> Bool
  func getNavigationAction(for index: Int) -> (() -> Void)?
}

final class MissionsScreenViewModel: MissionsScreenViewModelProtocol {
  var missions: [Mission] = []
  
  private var router: MissionsRouterProtocol?
  private let storage = MissionsStorage()
  
  init(router: MissionsRouterProtocol?) {
    self.router = router
    
    if let saved = storage.loadMissions() {
      self.missions = saved
    } else {
      
      self.missions = [
        Mission(title: "Missão 1: O segredo do armário",
                description: "Disponível",
                imageName: "medal1-bw",
                status: .unlocked),
        Mission(title: "Missão 2: O toque da festa",
                description: "Bloqueada",
                imageName: "medal2-bw",
                status: .locked),
        Mission(title: "Missão 3: O jogo da confusão",
                description: "Bloqueada",
                imageName: "medal3-bw",
                status: .locked),
        Mission(title: "Missão 4: A festa do primo",
                description: "Bloqueada",
                imageName: "medal4-bw",
                status: .locked)
      ]
      storage.saveMissions(missions)
    }
  }
  
  func markMissionsCompleted(at index: Int) {
      guard index < missions.count else { return }
      
      missions[index].status = .completed
      missions[index].description = "Completa"
      
      let completedImageNames = ["medal1", "medal2", "medal3", "medal4"]
      if index < completedImageNames.count {
          missions[index].imageName = completedImageNames[index]
      }
      
      if index + 1 < missions.count {
          missions[index + 1].status = .unlocked
          missions[index + 1].description = "Disponível"
      }
      
      storage.saveMissions(missions)
      
      NotificationCenter.default.post(name: .missionsUpdated, object: nil)
  }

  
  func canNavigateToMission(at index: Int) -> Bool {
    guard index < missions.count else { return false }
    return missions[index].status == .unlocked || missions[index].status == .completed
  }
  
  func getNavigationAction(for index: Int) -> (() -> Void)? {
    guard canNavigateToMission(at: index) else { return nil }
    
    switch index {
    case 0: return { [weak self] in self?.router?.navigateToFirstMission() }
    case 1: return { [weak self] in self?.router?.navigateToSecondMission() }
    case 2: return { [weak self] in self?.router?.navigateToThirdMission() }
    case 3: return { [weak self] in self?.router?.navigateToFourthMission() }
    default: return nil
    }
  }
}
