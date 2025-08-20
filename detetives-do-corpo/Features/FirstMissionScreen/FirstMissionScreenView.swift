import UIKit

class FirstMissionScreenView: UIView {

  private let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logo-2"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let laraImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "lara"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let historyBallon = CustomButton(buttonTitle: "Lara está muito mudada e quieta após uma festa de aniversário do primo, não quer mais brincar e não conversa com ninguém, o que você faz?", background: .white, fontColor: .black)
  
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
    addSubview(laraImageView)
    addSubview(historyBallon)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -50),
      logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34),
      logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 340),
      
      laraImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -40),
      laraImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      laraImageView.heightAnchor.constraint(equalToConstant: 240),
      laraImageView.widthAnchor.constraint(equalToConstant: 400),
      
      historyBallon.topAnchor.constraint(equalTo: laraImageView.bottomAnchor, constant: 40),
      historyBallon.leadingAnchor.constraint(equalTo: laraImageView.leadingAnchor),
      historyBallon.trailingAnchor.constraint(equalTo: laraImageView.trailingAnchor)
    ])
  }
}
