import Foundation

protocol MissionFinishedViewModelProtocol: AnyObject {
  
}

protocol MissionFinishedNavigationDelegate: AnyObject {
  
}

class MissionFinishedViewModel {
  private weak var navigationDelegate: MissionFinishedNavigationDelegate?
  
  init(navigationDelegate: MissionFinishedNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension MissionFinishedViewModel: MissionFinishedViewModelProtocol {
  
}
