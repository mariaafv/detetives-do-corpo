import UIKit

class MissionFinishedView: UIView {
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.alignment = .fill
    stackView.axis = .vertical
    stackView.spacing = 20
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private let bannerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.text = "Missão concluída!"
    titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    titleLabel.textColor = .black
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 0
    return titleLabel
  }()
  
  private let descriptionLabel: UILabel = {
    let descriptionLabel = UILabel()
    descriptionLabel.text = "Parabéns! Você e Lara conversaram com um adulto responsável e com isso ela está se sentindo mais segura.\n\n Você é um bom amigo e ganhou uma medalha!"
    descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textAlignment = .center
    return descriptionLabel
  }()
  
  let returnButton = CustomButton(buttonTitle: "Voltar", background: .brown, fontColor: .white)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    backgroundColor = .background
    addSubview(stackView)
    stackView.addArrangedSubview(bannerImageView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(descriptionLabel)
    stackView.addArrangedSubview(returnButton)
  }
  
  private func setupConstraints() {
    descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
    stackView.setCustomSpacing(40, after: descriptionLabel)
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
      
      bannerImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
      bannerImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
      
      returnButton.heightAnchor.constraint(equalToConstant: 50),
      returnButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 64),
      returnButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -64)
    ])
  }
}

extension MissionFinishedView {
  func setBannerImage(_ image: UIImage?) {
    bannerImageView.image = image
  }
}
