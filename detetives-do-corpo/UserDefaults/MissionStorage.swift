import Foundation

final class MissionsStorage {
  private let key = "missions_data"
  private let defaults: UserDefaults

  init(defaults: UserDefaults = .standard) {
    self.defaults = defaults
  }

  func save(_ missions: [Mission]) {
    do {
      let data = try JSONEncoder().encode(missions)
      defaults.set(data, forKey: key)
    } catch {
      print("❌ Erro ao salvar missions:", error)
    }
  }

  func load() -> [Mission] {
    guard let data = defaults.data(forKey: key) else { return [] }
    do {
      return try JSONDecoder().decode([Mission].self, from: data)
    } catch {
      print("❌ Erro ao carregar missions:", error)
      return []
    }
  }

  func updateMission(at index: Int, update: (inout Mission) -> Void) {
    var missions = load()
    guard missions.indices.contains(index) else { return }
    update(&missions[index])
    save(missions)
  }

  func completeMission(at index: Int) {
    updateMission(at: index) { mission in
      mission.status = .completed
      mission.description = "Completa"
    }
  }

  func reset() {
    defaults.removeObject(forKey: key)
  }
}
