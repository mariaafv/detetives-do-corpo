import UIKit

class MissionsScreenView: UIView {
  
  private let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logo-2"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let mapImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "background_map"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 24
    imageView.layer.borderColor = UIColor.brown.cgColor
    imageView.layer.borderWidth = 2
    imageView.clipsToBounds = true
    imageView.layer.masksToBounds = true
    imageView.isUserInteractionEnabled = true
    return imageView
  }()
  
  private let firstMissionPinImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "black-pin"))
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .black
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let firstMissionButton = CustomButton(buttonTitle: "O segredo do armário", background: .brown, fontColor: .white)
  
  private let secondMissionPinImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "black-pin"))
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .black
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let secondMissionButton = CustomButton(buttonTitle: "O toque da festa", background: .brown, fontColor: .white)
  
  private let thirdMissionPinImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "black-pin"))
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .black
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let thirdMissionButton = CustomButton(buttonTitle: "O jogo da confusão", background: .brown, fontColor: .white)
  
  private let fourthMissionPinImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "black-pin"))
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .black
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let fourthMissionButton = CustomButton(buttonTitle: "A festa do primo", background: .brown, fontColor: .white)

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
    addSubview(mapImageView)
    mapImageView.addSubview(firstMissionPinImageView)
    mapImageView.addSubview(firstMissionButton)
    mapImageView.addSubview(secondMissionPinImageView)
    mapImageView.addSubview(secondMissionButton)
    mapImageView.addSubview(thirdMissionPinImageView)
    mapImageView.addSubview(thirdMissionButton)
    mapImageView.addSubview(fourthMissionPinImageView)
    mapImageView.addSubview(fourthMissionButton)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -50),
      logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34),
      logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 340),
      
      mapImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -40),
      mapImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      mapImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      mapImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      firstMissionPinImageView.leadingAnchor.constraint(equalTo: mapImageView.leadingAnchor, constant: 40),
      firstMissionPinImageView.topAnchor.constraint(equalTo: mapImageView.topAnchor, constant: 64),
      firstMissionPinImageView.heightAnchor.constraint(equalToConstant: 48),
      firstMissionPinImageView.widthAnchor.constraint(equalToConstant: 48),
      
      firstMissionButton.topAnchor.constraint(equalTo: firstMissionPinImageView.topAnchor, constant: 18),
      firstMissionButton.leadingAnchor.constraint(equalTo: firstMissionPinImageView.trailingAnchor, constant: 12),
      
      secondMissionPinImageView.leadingAnchor.constraint(equalTo: firstMissionPinImageView.trailingAnchor, constant: 48),
      secondMissionPinImageView.topAnchor.constraint(equalTo: firstMissionPinImageView.bottomAnchor, constant: 64),
      secondMissionPinImageView.heightAnchor.constraint(equalToConstant: 48),
      secondMissionPinImageView.widthAnchor.constraint(equalToConstant: 48),
      
      secondMissionButton.topAnchor.constraint(equalTo: secondMissionPinImageView.topAnchor, constant: 18),
      secondMissionButton.leadingAnchor.constraint(equalTo: secondMissionPinImageView.trailingAnchor, constant: 12),
      
      thirdMissionPinImageView.trailingAnchor.constraint(equalTo: secondMissionPinImageView.leadingAnchor, constant: -34),
      thirdMissionPinImageView.topAnchor.constraint(equalTo: secondMissionPinImageView.bottomAnchor, constant: 64),
      thirdMissionPinImageView.heightAnchor.constraint(equalToConstant: 48),
      thirdMissionPinImageView.widthAnchor.constraint(equalToConstant: 48),
      
      thirdMissionButton.topAnchor.constraint(equalTo: thirdMissionPinImageView.topAnchor, constant: 18),
      thirdMissionButton.leadingAnchor.constraint(equalTo: thirdMissionPinImageView.trailingAnchor, constant: 12),
      
      fourthMissionPinImageView.leadingAnchor.constraint(equalTo: thirdMissionPinImageView.trailingAnchor, constant: 68),
      fourthMissionPinImageView.topAnchor.constraint(equalTo: thirdMissionPinImageView.bottomAnchor, constant: 64),
      fourthMissionPinImageView.heightAnchor.constraint(equalToConstant: 48),
      fourthMissionPinImageView.widthAnchor.constraint(equalToConstant: 48),
      
      fourthMissionButton.topAnchor.constraint(equalTo: fourthMissionPinImageView.topAnchor, constant: 18),
      fourthMissionButton.leadingAnchor.constraint(equalTo: fourthMissionPinImageView.trailingAnchor, constant: 12),
    ])
  }
}
