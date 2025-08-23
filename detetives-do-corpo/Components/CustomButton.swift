import UIKit

final class CustomButton: UIButton {
  
  var buttonTitle: String
  var background: UIColor
  var fontColor: UIColor
  var alignLeft: Bool
  var isInteractionEnable: Bool
  
  // MARK: - Init
  init(buttonTitle: String, background: UIColor, fontColor: UIColor, alignLeft: Bool = false, isInteractionEnable: Bool = true) {
    self.buttonTitle = buttonTitle
    self.background = background
    self.fontColor = fontColor
    self.alignLeft = alignLeft
    self.isInteractionEnable = isInteractionEnable
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
    setTitle(buttonTitle, for: .normal)
    backgroundColor = background
    setTitleColor(fontColor, for: .normal)
    layer.cornerRadius = 24
    titleLabel?.numberOfLines = 0
    titleLabel?.lineBreakMode = .byWordWrapping
    isUserInteractionEnabled = isInteractionEnable
    
    if alignLeft {
      titleLabel?.textAlignment = .left
      contentHorizontalAlignment = .leading
    } else {
      titleLabel?.textAlignment = .center
      contentHorizontalAlignment = .center
    }
    
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
  
  func updateBackgroundColor(_ color: UIColor) {
    backgroundColor = color
    if #available(iOS 15.0, *) {
      var config = self.configuration
      config?.baseBackgroundColor = color
      config?.background.strokeColor = color
      config?.background.strokeWidth = 0
      self.configuration = config
    } else {
      self.backgroundColor = color
    }
  }
}
