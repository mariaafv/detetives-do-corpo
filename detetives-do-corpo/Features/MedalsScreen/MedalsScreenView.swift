// MARK: - MedalsView.swift

import UIKit

class MedalsView: UIView {
  
  private let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logo-2"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
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
      let itemSize = (self.frame.size.width - 80) / 3
      layout.itemSize = CGSize(width: itemSize, height: itemSize)
    }
  }
  
  func setupviews() {
    addSubview(logoImageView)
    addSubview(collectionView)
  }
  
  private func installConstraints() {
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -40),
      logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34),
      logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 340),
      
      collectionView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -50),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
