import UIKit

extension Notification.Name {
    static let missionsUpdated = Notification.Name("missionsUpdated")
}

final class MissionsScreenViewController: UIViewController {
  private let baseView = MissionsScreenView()
  private let viewModel: MissionsScreenViewModelProtocol
  
  init(viewModel: MissionsScreenViewModelProtocol) {
    self.viewModel = viewModel
    NotificationCenter.default.post(name: .missionsUpdated, object: nil)
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
    
    NotificationCenter.default.addObserver(self, selector: #selector(reloadMissions), name: .missionsUpdated, object: nil)
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
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MissionCell.identifier, for: indexPath) as? MissionCell else {
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
    
    viewModel.markMissionsCompleted(at: indexPath.item)
    var indexPathsToReload = [indexPath]
    if indexPath.item + 1 < viewModel.missions.count {
        indexPathsToReload.append(IndexPath(item: indexPath.item + 1, section: 0))
    }
    collectionView.reloadItems(at: indexPathsToReload)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let spacing: CGFloat = 8
      let width = collectionView.bounds.width - spacing
      return CGSize(width: width, height: 100)
  }

}
