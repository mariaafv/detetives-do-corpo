import UIKit

class InitialScreenView: UIView {
  
  private let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logo"))
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = L10n.welcomedetective
    label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    label.textColor = .white
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.spacing = 20
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let missionsButton: CustomButton = {
    let button = CustomButton(buttonTitle: L10n.missionsMap, background: .yellowButton, fontColor: .black)
    return button
  }()
  
  let medalsButton: CustomButton = {
    let button = CustomButton(buttonTitle: L10n.medals, background: .yellowButton, fontColor: .black)
    return button
  }()
  
  let emojiButton: CustomButton = {
    let button = CustomButton(buttonTitle: L10n.whoAreWe, background: .yellowButton, fontColor: .black)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    addSubview(logoImageView)
    addSubview(welcomeLabel)
    addSubview(stackView)
    stackView.addArrangedSubview(missionsButton)
    stackView.addArrangedSubview(medalsButton)
    stackView.addArrangedSubview(emojiButton)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 220),
      logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      logoImageView.widthAnchor.constraint(equalToConstant: 200),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      
      welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
      welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 46),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -46),
    ])
  }
}
