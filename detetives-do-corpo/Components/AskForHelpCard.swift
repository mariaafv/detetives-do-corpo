import UIKit

class HelpOptionCardView: UIView {
  private let iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .background
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .background
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 17, weight: .bold)
    return label
  }()
  
  private let subtitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 14, weight: .regular)
    return label
  }()
  
  private let textStackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 2
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
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
    backgroundColor = .yellowButton
    layer.cornerRadius = 24
    layer.masksToBounds = true
    translatesAutoresizingMaskIntoConstraints = false
    
    textStackView.addArrangedSubview(titleLabel)
    textStackView.addArrangedSubview(subtitleLabel)
    
    addSubview(iconImageView)
    addSubview(textStackView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: 90),
      
      iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      iconImageView.widthAnchor.constraint(equalToConstant: 40),
      iconImageView.heightAnchor.constraint(equalToConstant: 40),
      
      textStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
      textStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      textStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  public func configure(icon: UIImage?, title: String, subtitle: String) {
    iconImageView.image = icon
    titleLabel.text = title
    subtitleLabel.text = subtitle
  }
}
