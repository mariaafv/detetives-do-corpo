import Foundation

protocol MedalsScreenViewModelProtocol: AnyObject {
  var onDataUpdated: (() -> Void)? { get set }
  func fetchMedals()
  func numberOfItems() -> Int
  func medal(at index: Int) -> Medal
  func didSelectMedal(at index: Int) -> Medal?
}

final class MedalsViewModel: MedalsScreenViewModelProtocol {
  // MARK: - Public API
  var onDataUpdated: (() -> Void)?
  func numberOfItems() -> Int { medals.count }
  func medal(at index: Int) -> Medal { medals[index] }
  func didSelectMedal(at index: Int) -> Medal? { medals[index].isEarned ? medals[index] : nil }
  
  func fetchMedals() {
    let missionsSaved = storage.load()
    medals = buildMedals(from: missionPhase, missionsSaved: missionsSaved)
    onDataUpdated?()
  }
  
  // MARK: - Init / DI
  private var medals: [Medal] = []
  private let storage: MissionsStorage
  private let missionPhase: MissionPhase
  
  init(missionPhase: MissionPhase = MissionPhase(),
       storage: MissionsStorage = MissionsStorage()) {
    self.missionPhase = missionPhase
    self.storage = storage
    
    NotificationCenter.default.addObserver(
      forName: .missionsUpdated, object: nil, queue: .main
    ) { [weak self] _ in
      self?.fetchMedals()
    }
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self, name: .missionsUpdated, object: nil)
  }
  
  // MARK: - Builder interno
  private func buildMedals(from model: MissionPhase,
                           missionsSaved: [Mission]) -> [Medal] {
    
    let titles = ["Amigo do Coração", "Mestre da Confiança", "Guardião dos Segredos", "Detetive do Corpo"]
    let earnedFallback = ["medal1", "medal2", "medal3", "medal4"]
    let lockedFallback = ["medal1-bw", "medal2-bw", "medal3-bw", "medal4-bw"]
    
    return model.missions.enumerated().map { idx, mission in
      let isEarned = idx < missionsSaved.count && missionsSaved[idx].status == .completed
      
      let earnedName: String = {
        let name = mission.conquestImageName
        if name.hasPrefix("medal") { return name } // exemplo: "medal1"
        return idx < earnedFallback.count ? earnedFallback[idx] : "medal"
      }()
      
      let lockedName: String = {
        let bw = earnedName + "-bw"
        return idx < lockedFallback.count ? lockedFallback[idx] : bw
      }()
      
      let title = idx < titles.count ? titles[idx] : "Medalha \(idx + 1)"
      let imageName = isEarned ? earnedName : lockedName
      
      return Medal(
        title: title,
        description: mission.medalDescription,
        imageName: imageName,
        isEarned: isEarned
      )
    }
  }
}
