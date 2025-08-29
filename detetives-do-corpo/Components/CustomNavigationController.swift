import UIKit

class CustomNavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationBar.barTintColor = .background
    navigationBar.isTranslucent = true
    navigationBar.tintColor = .white
    
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .background
    
    appearance.titleTextAttributes = [
      .foregroundColor: UIColor.white,
      .font: UIFont.boldSystemFont(ofSize: 20)
    ]
    
    let backButtonAppearance = UIBarButtonItemAppearance()
    backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
    appearance.backButtonAppearance = backButtonAppearance
    
    navigationBar.standardAppearance = appearance
    navigationBar.scrollEdgeAppearance = appearance
    navigationBar.compactAppearance = appearance
  }
}
