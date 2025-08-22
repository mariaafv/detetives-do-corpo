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
  let bannerImage: UIImage?
  
  init(navigationDelegate: MissionFinishedNavigationDelegate?, bannerImage: UIImage?) {
    self.navigationDelegate = navigationDelegate
    self.bannerImage = bannerImage
  }
}

extension MissionFinishedViewModel: MissionFinishedViewModelProtocol {
  func backToMissionsScreen() {
    navigationDelegate?.backToMissionsScreen()
  }
}
