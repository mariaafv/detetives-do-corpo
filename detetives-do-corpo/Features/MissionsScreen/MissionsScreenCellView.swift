import UIKit

final class MissionCell: UICollectionViewCell {
  static let identifier = "MissionCell"
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    configureViews()
    addConstraints()
  }
  
  override func prepareForReuse() {
      super.prepareForReuse()
      imageView.image = nil
      titleLabel.text = nil
      descriptionLabel.text = nil
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with mission: Mission) {
    imageView.image = mission.image
    titleLabel.text = mission.title
    descriptionLabel.text = mission.description
    
    contentView.alpha = mission.isUnlocked ? 1.0 : 0.5
  }
  
  func configureViews() {
    contentView.backgroundColor = .white
    contentView.layer.cornerRadius = 12
    contentView.layer.shadowColor = UIColor.black.cgColor
    contentView.layer.shadowOpacity = 0.1
    contentView.layer.shadowRadius = 4
    contentView.layer.masksToBounds = false
    layer.masksToBounds = false
    
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    descriptionLabel.font = UIFont.systemFont(ofSize: 16)
    descriptionLabel.textColor = .darkGray
    descriptionLabel.numberOfLines = 2
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupViews() {
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(descriptionLabel)
  }
  
  private func addConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
      imageView.widthAnchor.constraint(equalToConstant: 80),
      imageView.heightAnchor.constraint(equalToConstant: 120),
      imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 54),
      titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
      
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
      descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
      descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
    ])
  }
}
