// MARK: - MedalsViewController.swift (Versão Refatorada)

import UIKit

class MedalsViewController: UIViewController {
  
  private var viewModel: MedalsScreenViewModelProtocol
  private var medalsView: MedalsView?
  
  init(viewModel: MedalsScreenViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    let view = MedalsView()
    self.medalsView = view
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Vitrine de Medalhas"
    
    medalsView?.collectionView.dataSource = self
    medalsView?.collectionView.delegate = self
    
    bindViewModel()
    viewModel.fetchMedals()
  }
  
  private func bindViewModel() {
    viewModel.onDataUpdated = { [weak self] in
      self?.medalsView?.collectionView.reloadData()
    }
  }
  
  private func showMedalDetails(for medal: Medal) {
    let alertController = UIAlertController(
      title: medal.title,
      message: medal.description,
      preferredStyle: .alert
    )
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alertController, animated: true)
  }
}

// MARK: - UICollectionViewDataSource & Delegate (Sem alterações)
extension MedalsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfItems()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MedalCell.identifier, for: indexPath) as? MedalCell else {
      return UICollectionViewCell()
    }
    
    let medal = viewModel.medal(at: indexPath.item)
    cell.configure(with: medal)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let earnedMedal = viewModel.didSelectMedal(at: indexPath.item) {
      showMedalDetails(for: earnedMedal)
    } else {
      print("Esta medalha está bloqueada!")
    }
  }
}
