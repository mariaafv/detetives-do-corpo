import UIKit

class CustomButton: UIView {
  var buttonTitle: String?
  var background: UIColor?
  
  lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle(buttonTitle, for: UIControl.State.normal)
    button.backgroundColor = background
    button.tintColor = .white
    button.layer.cornerRadius = 24
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  init(buttonTitle: String, background: UIColor) {
    super.init(frame: .zero)

    self.buttonTitle = buttonTitle
    self.background = background
    self.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubviews()
    self.addConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addSubviews() {
    addSubview(button)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: topAnchor),
      button.leadingAnchor.constraint(equalTo: leadingAnchor),
      button.trailingAnchor.constraint(equalTo: trailingAnchor),
      button.bottomAnchor.constraint(equalTo: bottomAnchor),
      button.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}
