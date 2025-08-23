import UIKit

class FirstMissionSecondScreenView: UIView {

  private let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logo-2"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let laraImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "lara2"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let historyBallon = CustomButton(buttonTitle: "Vocês conversam e ela conta que foi na festa do aniversário do primo durante o fim de semana, lá um amigo do primo a levou para uma brincadeira secreta dentro do armário da casa, o que a deixou triste e com medo. O que você faz?", background: .backgroundBaloon, fontColor: .black, alignLeft: true, isInteractionEnable: false)
  
  let firstAnswerBallon = CustomButton(buttonTitle: "Diz que segredos que nos machucam não são segredos bons, e que ela pode confiar em você para pedir ajuda.", background: .white, fontColor: .black, alignLeft: true)
  
  let secondAnswerBallon = CustomButton(buttonTitle: "Deixa para lá e diz que ela pode contar quando quiser", background: .white, fontColor: .black, alignLeft: true)

  let thirdAnswerBallon = CustomButton(buttonTitle: "Ameaça não ser mais amigo dela caso ela não conte sobre a brincadeira secreta", background: .white, fontColor: .black, alignLeft: true)
  
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
