import UIKit

protocol MissionsScreenViewModelProtocol: AnyObject {
  var missions: [Mission] { get }
}

final class MissionsScreenViewModel: MissionsScreenViewModelProtocol {
  var missions: [Mission] = []
  private var router: MissionsRouterProtocol?
  
  init(router: MissionsRouterProtocol?) {
    self.router = router
    
    self.missions = [
      Mission(title: "Missão 1: O segredo do armário",
              description: "Disponível",
              image: UIImage(named: "medal1-bw"),
              isUnlocked: true,
              navigate: { [weak router] in router?.navigateToFirstMission() }),
      Mission(title: "Missão 2: O toque da festa",
              description: "Bloqueada",
              image: UIImage(named: "medal2-bw"),
              isUnlocked: false,
              navigate: { [weak router] in router?.navigateToSecondMission() }),
      Mission(title: "Missão 3: O jogo da confusão",
              description: "Bloqueada",
              image: UIImage(named: "medal3-bw"),
              isUnlocked: false,
              navigate: { [weak router] in router?.navigateToThirdMission() }),
      Mission(title: "Missão 4: A festa do primo",
              description: "Bloqueada",
              image: UIImage(named: "medal4-bw"),
              isUnlocked: false,
              navigate: { [weak router] in router?.navigateToFourthMission() })
    ]
  }
}
