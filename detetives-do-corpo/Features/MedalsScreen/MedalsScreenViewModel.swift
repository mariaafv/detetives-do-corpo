import Foundation

protocol MedalsScreenViewModelProtocol: AnyObject {
  var onDataUpdated: (() -> Void)? { get set }
  
  func fetchMedals()
  func numberOfItems() -> Int
  func medal(at index: Int) -> Medal
  func didSelectMedal(at index: Int) -> Medal?
}

class MedalsViewModel: MedalsScreenViewModelProtocol {
  
  // MARK: - Properties
  
  private var medals: [Medal] = []
  var onDataUpdated: (() -> Void)?
  
  // MARK: - Data Source
  
  func numberOfItems() -> Int {
    return medals.count
  }
  
  func medal(at index: Int) -> Medal {
    return medals[index]
  }
  
  // MARK: - Logic
  func fetchMedals() {
    self.medals = [
      Medal(title: "Amigo do Coração", description: "Ganha por aprender a escutar e ajudar os amigos na missão 1.", imageName: "medal1", isEarned: true),
      Medal(title: "Mestre da Confiança", description: "Sabe identificar os adultos de confiança.", imageName: "medal2", isEarned: true),
      Medal(title: "Guardião dos Segredos", description: "Aprendeu a diferença entre segredos bons e ruins.", imageName: "medal3", isEarned: false),
      Medal(title: "Detetive do Corpo", description: "Ganha por completar a Missão 4 e entender sobre os limites do corpo.", imageName: "medal4", isEarned: false),
    ]
  
    onDataUpdated?()
  }
  
  func didSelectMedal(at index: Int) -> Medal? {
    let selectedMedal = medals[index]
    return selectedMedal.isEarned ? selectedMedal : nil
  }
}
