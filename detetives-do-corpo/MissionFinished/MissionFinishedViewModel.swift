import Foundation
import UIKit

protocol MissionFinishedViewModelProtocol: AnyObject {
  var bannerImage: UIImage? { get }
  var medalDescription: String { get }
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
  let medalDescription: String
  
  init(navigationDelegate: MissionFinishedNavigationDelegate?,
       bannerImage: UIImage?,
       medalDescription: String,
       missionsViewModel: MissionsScreenViewModelProtocol,
       missionIndex: Int) {
    self.navigationDelegate = navigationDelegate
    self.bannerImage = bannerImage
    self.medalDescription = medalDescription
    self.missionsViewModel = missionsViewModel
    self.missionIndex = missionIndex
  }
}

extension MissionFinishedViewModel: MissionFinishedViewModelProtocol {
  func backToMissionsScreen() {
    missionsViewModel.markMissionsCompleted(at: missionIndex - 1)
    
    NotificationCenter.default.post(name: .missionsUpdated, object: nil)
    
    navigationDelegate?.backToMissionsScreen()
  }
}
