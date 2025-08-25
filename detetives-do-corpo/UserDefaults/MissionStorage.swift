import Foundation

final class MissionsStorage {
  private let key = "missions_data"
  
  func saveMissions(_ missions: [Mission]) {
    do {
      let data = try JSONEncoder().encode(missions)
      UserDefaults.standard.set(data, forKey: key)
    } catch {
      print("Erro ao salvar missions:", error)
    }
  }
  
  func loadMissions() -> [Mission]? {
    guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
    do {
      return try JSONDecoder().decode([Mission].self, from: data)
    } catch {
      print("Erro ao carregar missions:", error)
      return nil
    }
  }
  
}
