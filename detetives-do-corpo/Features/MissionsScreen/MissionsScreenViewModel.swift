import UIKit

protocol MissionsScreenViewModelProtocol: AnyObject {
  var missions: [Mission] { get }
  
  func markMissionsCompleted(at index: Int)
  func canNavigateToMission(at index: Int) -> Bool
  func getNavigationAction(for index: Int) -> (() -> Void)?
}

final class MissionsScreenViewModel: MissionsScreenViewModelProtocol {
  
  // MARK: - Public
  private(set) var missions: [Mission] = []
  
  // MARK: - Dependencies
  private var router: MissionsRouterProtocol?
  private let storage: MissionsStorage
  
  // MARK: - Init
  init(router: MissionsRouterProtocol?, storage: MissionsStorage = MissionsStorage()) {
    self.router = router
    self.storage = storage
    bootstrapIfNeeded()
  }
  
  // MARK: - Bootstrap (carrega do storage ou cria default e persiste)
  private func bootstrapIfNeeded() {
    let loaded = storage.load()
    if loaded.isEmpty {
      // estado inicial
      self.missions = [
        Mission(title: L10n.firstMissionTitle,
                description: L10n.available,
                imageName: "medal1-bw",
                status: .unlocked),
        Mission(title: L10n.secondMissionTitle,
                description: L10n.blocked,
                imageName: "medal2-bw",
                status: .locked),
        Mission(title: L10n.thirdMissionTitle,
                description: L10n.blocked,
                imageName: "medal3-bw",
                status: .locked),
        Mission(title: L10n.fourthMissionTitle,
                description: L10n.blocked,
                imageName: "medal4-bw",
                status: .locked)
      ]
      storage.save(missions)
    } else {
      self.missions = loaded
    }
  }
  
  // MARK: - Progress / Update
  func markMissionsCompleted(at index: Int) {
    guard missions.indices.contains(index) else { return }
    
    var updated = storage.load()
    if updated.isEmpty { updated = missions }
    
    updated[index].status = .completed
    updated[index].description = "Completa"
    
    let completedImageNames = ["medal1", "medal2", "medal3", "medal4"]
    if index < completedImageNames.count {
      updated[index].imageName = completedImageNames[index]
    }
    
    if updated.indices.contains(index + 1) {
      updated[index + 1].status = .unlocked
      updated[index + 1].description = L10n.available
    }
    
    storage.save(updated)
    self.missions = updated
    
    NotificationCenter.default.post(name: .missionsUpdated, object: nil)
  }
  
  // MARK: - Navigation rules
  func canNavigateToMission(at index: Int) -> Bool {
    guard missions.indices.contains(index) else { return false }
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
