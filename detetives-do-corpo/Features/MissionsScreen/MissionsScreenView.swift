import UIKit

final class MissionsScreenView: UIView {
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    //layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 160)
    layout.minimumInteritemSpacing = 8
    layout.minimumLineSpacing = 16
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .clear
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .background
    
    addSubview(collectionView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
