import Foundation

protocol MissionsScreenViewModelProtocol: AnyObject {
  func didTapFirstMission()
}

protocol MissionsScreenNavigationDelegate: AnyObject {
  func didTapFirstMission()
}

class MissionsScreenViewModel {
  private weak var navigationDelegate: MissionsScreenNavigationDelegate?
  
  init(navigationDelegate: MissionsScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension MissionsScreenViewModel: MissionsScreenViewModelProtocol {
  func didTapFirstMission() {
    navigationDelegate?.didTapFirstMission()
  }
}
