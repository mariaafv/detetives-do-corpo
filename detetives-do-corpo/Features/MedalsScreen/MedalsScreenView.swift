// MARK: - MedalsView.swift

import UIKit

class MedalsView: UIView {
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(MedalCell.self, forCellWithReuseIdentifier: MedalCell.identifier)
    collectionView.backgroundColor = .background
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .background
    setupviews()
    installConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      let itemSize = (self.frame.size.width - 80) / 2
      layout.itemSize = CGSize(width: itemSize, height: itemSize)
    }
  }
  
  func setupviews() {
    addSubview(collectionView)
  }
  
  private func installConstraints() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
