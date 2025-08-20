import Foundation

protocol FirstMissionScreenViewModelProtocol: AnyObject {
}

protocol FirstMissionScreenNavigationDelegate: AnyObject {
  //code
}

class FirstMissionScreenViewModel {
  private weak var navigationDelegate: FirstMissionScreenNavigationDelegate?
  
  init(navigationDelegate: FirstMissionScreenNavigationDelegate?) {
    self.navigationDelegate = navigationDelegate
  }
}

extension FirstMissionScreenViewModel: FirstMissionScreenViewModelProtocol {
}
