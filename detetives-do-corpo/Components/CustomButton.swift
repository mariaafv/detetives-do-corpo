import UIKit

final class CustomButton: UIButton {
  
  private var buttonTitle: String
  private var background: UIColor
  private var fontColor: UIColor
  
  // MARK: - Init
  init(buttonTitle: String, background: UIColor, fontColor: UIColor) {
    self.buttonTitle = buttonTitle
    self.background = background
    self.fontColor = fontColor
    super.init(frame: .zero)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup
  private func setupView() {
    configure()
    setupConstraints()
  }
  
  private func configure() {
    // Configuração do botão
    setTitle(buttonTitle, for: .normal)
    backgroundColor = background
    setTitleColor(fontColor, for: .normal)
    layer.cornerRadius = 24
    translatesAutoresizingMaskIntoConstraints = false
    
    if #available(iOS 15.0, *) {
      var config = UIButton.Configuration.filled()
      config.title = buttonTitle
      config.baseBackgroundColor = background
      config.baseForegroundColor = fontColor
      config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
      config.cornerStyle = .capsule
      self.configuration = config
    } else {
      contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
    }
  }
  
  private func setupConstraints() {
    self.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
  }
}
