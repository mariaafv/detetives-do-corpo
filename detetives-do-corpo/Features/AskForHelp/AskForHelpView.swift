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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    
    contentView.addSubview(logoImageView)
    contentView.addSubview(descriptionText)
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
      logoImageView.widthAnchor.constraint(equalToConstant: 340),
      
      descriptionText.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -30),
      descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
    ])
  }
}
