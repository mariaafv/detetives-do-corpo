import Foundation
import UIKit

protocol MissionFinishedViewModelProtocol: AnyObject {
    var bannerImage: UIImage? { get }
    func backToMissionsScreen()
}

protocol MissionFinishedNavigationDelegate: AnyObject {
    func backToMissionsScreen()
}

class MissionFinishedViewModel {
    private weak var navigationDelegate: MissionFinishedNavigationDelegate?
    private let missionsViewModel: MissionsScreenViewModelProtocol
    private let missionIndex: Int
    let bannerImage: UIImage?
    
    init(
        navigationDelegate: MissionFinishedNavigationDelegate?,
        bannerImage: UIImage?,
        missionsViewModel: MissionsScreenViewModelProtocol,
        missionIndex: Int
    ) {
        self.navigationDelegate = navigationDelegate
        self.bannerImage = bannerImage
        self.missionsViewModel = missionsViewModel
        self.missionIndex = missionIndex
    }
}

extension MissionFinishedViewModel: MissionFinishedViewModelProtocol {
    func backToMissionsScreen() {
        // Marca a missão como concluída só aqui
        missionsViewModel.markMissionsCompleted(at: missionIndex)
        
        // Notifica a tela de missões para atualizar
        NotificationCenter.default.post(name: .missionsUpdated, object: nil)
        
        // Faz a navegação de volta
        navigationDelegate?.backToMissionsScreen()
    }
}
