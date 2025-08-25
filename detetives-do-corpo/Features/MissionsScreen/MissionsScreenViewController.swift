import UIKit

extension Notification.Name {
  static let missionsUpdated = Notification.Name("missionsUpdated")
}

final class MissionsScreenViewController: UIViewController {
  private let baseView = MissionsScreenView()
  let viewModel: MissionsScreenViewModelProtocol
  private let router: MissionsRouterProtocol
  
  init(viewModel: MissionsScreenViewModelProtocol, router: MissionsRouterProtocol) {
    self.viewModel = viewModel
    self.router = router
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    self.view = baseView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    
    NotificationCenter.default.addObserver(self,selector: #selector(reloadMissions),name: .missionsUpdated,object: nil)
  }
  
  @objc private func reloadMissions() {
    baseView.collectionView.reloadData()
  }
  
  private func configureCollectionView() {
    baseView.collectionView.dataSource = self
    baseView.collectionView.delegate = self
    baseView.collectionView.register(MissionCell.self, forCellWithReuseIdentifier: MissionCell.identifier)
  }
}

extension MissionsScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.missions.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MissionCell.identifier,for: indexPath) as? MissionCell else {
      return UICollectionViewCell()
    }
    cell.configure(with: viewModel.missions[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard viewModel.canNavigateToMission(at: indexPath.item) else {
      print("Missão bloqueada")
      return
    }
    
    viewModel.getNavigationAction(for: indexPath.item)?()
  }
  
  func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let spacing: CGFloat = 8
    let width = collectionView.bounds.width - spacing
    return CGSize(width: width, height: 100)
  }
}
