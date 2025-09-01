import UIKit

class MedalCell: UICollectionViewCell {
  
  static let identifier = "MedalCell"
  
  private let medalImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.backgroundColor = .white
    imageView.layer.cornerRadius = 10
    return imageView
  }()
  
  private let lockImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    imageView.tintColor = .yellow
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.isHidden = true
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(medalImageView)
    contentView.addSubview(lockImageView)
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      medalImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      medalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
      medalImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      medalImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      
      lockImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      lockImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      lockImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
      lockImageView.heightAnchor.constraint(equalTo: lockImageView.widthAnchor)
    ])
  }
  
  public func configure(with medal: Medal) {
    medalImageView.image = UIImage(named: medal.imageName)
    
    if medal.isEarned {
      medalImageView.alpha = 1.0
      lockImageView.isHidden = true
    } else {
      medalImageView.alpha = 0.3
      lockImageView.isHidden = false
    }
  }
}
