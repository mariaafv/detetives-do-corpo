import UIKit

class AskForHelpScreenView: UIView {
  private let scrollView: UIScrollView = {
    let scroll = UIScrollView()
    scroll.translatesAutoresizingMaskIntoConstraints = false
    return scroll
  }()
  
  private let contentView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "peca-ajuda"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let descriptionText: UILabel = {
    let description = UILabel()
    description.text = "Detetive, se você estiver se sentindo triste, confuso(a) ou desconfortável, lembre-se: você pode pedir ajuda!"
    description.numberOfLines = 0
    description.textAlignment = .center
    description.textColor = .white
    description.font = .systemFont(ofSize: 17, weight: .medium)
    description.translatesAutoresizingMaskIntoConstraints = false
    return description
  }()
  
  private let cardsStackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 16
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  private let card1 = HelpOptionCardView()
  private let card2 = HelpOptionCardView()
  private let card3 = HelpOptionCardView()
  
  let cardUrgent: UIView = {
    let card = UIView()
    card.backgroundColor = .systemRed
    card.layer.cornerRadius = 24
    card.translatesAutoresizingMaskIntoConstraints = false
    return card
  }()
  
  private let cardUrgentLabel: UILabel = {
    let label = UILabel()
    label.text = "PRECISO DE AJUDA AGORA!"
    label.textColor = .white
    label.font = .systemFont(ofSize: 22, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let imageViewUrgent: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "ask-help"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Lembre-se: pedir ajuda é coisa de detetive corajoso!"
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .white
    label.font = .systemFont(ofSize: 17, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
    configureCards()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    
    contentView.addSubview(logoImageView)
    contentView.addSubview(descriptionText)
    contentView.addSubview(cardsStackView)
    cardsStackView.addArrangedSubview(card1)
    cardsStackView.addArrangedSubview(card2)
    cardsStackView.addArrangedSubview(card3)
    cardsStackView.addArrangedSubview(cardUrgent)
    cardUrgent.addSubview(cardUrgentLabel)
    cardsStackView.addArrangedSubview(imageViewUrgent)
    cardsStackView.addArrangedSubview(descriptionLabel)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: -50),
      logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
      logoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
      logoImageView.heightAnchor.constraint(equalToConstant: 180),
      
      descriptionText.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -30),
      descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      
      cardsStackView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 40),
      cardsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      cardsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      
      // IMPORTANTE: Conecte a base da stack view à base do contentView para o scroll funcionar
      cardsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
      
      cardUrgent.leadingAnchor.constraint(equalTo: cardsStackView.leadingAnchor),
      cardUrgent.trailingAnchor.constraint(equalTo: cardsStackView.trailingAnchor),
      cardUrgent.heightAnchor.constraint(equalToConstant: 80),
      
      cardUrgentLabel.centerYAnchor.constraint(equalTo: cardUrgent.centerYAnchor),
      cardUrgentLabel.centerXAnchor.constraint(equalTo: cardUrgent.centerXAnchor),
      
      imageViewUrgent.widthAnchor.constraint(equalToConstant: 360),
      imageViewUrgent.heightAnchor.constraint(equalToConstant: 140)
      
    ])
  }
}

extension AskForHelpScreenView {
  private func configureCards() {
    card1.configure(icon: UIImage(systemName: "person.fill"), title: "Converse com um adulto de confiança", subtitle: "Peça ajuda para sua mãe, pai ou responsável")
    card2.configure(icon: UIImage(systemName: "phone.badge.waveform.fill"), title: "Disque 100 - Direitos Humanos", subtitle: "Canal oficial para proteger crianças e adolescentes")
    card3.configure(icon: UIImage(systemName: "house.and.flag.fill"), title: "Fale com alguém da escola", subtitle: "Converse com sua professora ou orientadora")
  }
}
