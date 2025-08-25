import UIKit

class SecondMissionFirstScreenView: UIView {

  private let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logo-2"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let laraImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "tio1"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let historyBallon = CustomButton(buttonTitle: "Você está em uma festa animada, onde todos seus amigos estão brincando, durante a brincadeira, seu tio aparece e tenta te dar um beijo e um abraço, mas você fica desconfortável. O que você faz?", background: .backgroundBaloon, fontColor: .black, alignLeft: true, isInteractionEnable: false)
  
  let firstAnswerBallon = CustomButton(buttonTitle: "Você sai correndo e continua brincando com seus amigos", background: .white, fontColor: .black, alignLeft: true)
  
  let secondAnswerBallon = CustomButton(buttonTitle: "Finge que está confortável para não ser mal educado", background: .white, fontColor: .black, alignLeft: true)

  let thirdAnswerBallon = CustomButton(buttonTitle: "Você diz que não quer um beijo no momento e agradece o tio", background: .white, fontColor: .black, alignLeft: true)
  
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
    addSubview(firstAnswerBallon)
    addSubview(secondAnswerBallon)
    addSubview(thirdAnswerBallon)
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
      historyBallon.trailingAnchor.constraint(equalTo: laraImageView.trailingAnchor),
      
      firstAnswerBallon.topAnchor.constraint(equalTo: historyBallon.bottomAnchor, constant: 30),
      firstAnswerBallon.leadingAnchor.constraint(equalTo: laraImageView.leadingAnchor),
      firstAnswerBallon.trailingAnchor.constraint(equalTo: laraImageView.trailingAnchor),
      
      secondAnswerBallon.topAnchor.constraint(equalTo: firstAnswerBallon.bottomAnchor, constant: 10),
      secondAnswerBallon.leadingAnchor.constraint(equalTo: laraImageView.leadingAnchor),
      secondAnswerBallon.trailingAnchor.constraint(equalTo: laraImageView.trailingAnchor),
      
      thirdAnswerBallon.topAnchor.constraint(equalTo: secondAnswerBallon.bottomAnchor, constant: 10),
      thirdAnswerBallon.leadingAnchor.constraint(equalTo: laraImageView.leadingAnchor),
      thirdAnswerBallon.trailingAnchor.constraint(equalTo: laraImageView.trailingAnchor)
    ])
  }
}
