import UIKit

class PhaseScreenView: UIView {
  
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
    let imageView = UIImageView(image: UIImage(named: "logo-2"))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  var phaseImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let historyBallon = CustomButton(buttonTitle: "", background: .backgroundBaloon, fontColor: .black, alignLeft: true, isInteractionEnable: false)
  
  let firstAnswerBallon = CustomButton(buttonTitle: "", background: .white, fontColor: .black, alignLeft: true)
  
  let secondAnswerBallon = CustomButton(buttonTitle: "", background: .white, fontColor: .black, alignLeft: true)
  
  let thirdAnswerBallon = CustomButton(buttonTitle: "", background: .white, fontColor: .black, alignLeft: true)
  
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
    contentView.addSubview(phaseImageView)
    contentView.addSubview(historyBallon)
    contentView.addSubview(firstAnswerBallon)
    contentView.addSubview(secondAnswerBallon)
    contentView.addSubview(thirdAnswerBallon)
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
    ])
    
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: -50),
      logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
      logoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 340),
      
      phaseImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -40),
      phaseImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      phaseImageView.heightAnchor.constraint(equalToConstant: 240),
      phaseImageView.widthAnchor.constraint(equalToConstant: 400),
      
      historyBallon.topAnchor.constraint(equalTo: phaseImageView.bottomAnchor, constant: 40),
      historyBallon.leadingAnchor.constraint(equalTo: phaseImageView.leadingAnchor),
      historyBallon.trailingAnchor.constraint(equalTo: phaseImageView.trailingAnchor),
      
      firstAnswerBallon.topAnchor.constraint(equalTo: historyBallon.bottomAnchor, constant: 30),
      firstAnswerBallon.leadingAnchor.constraint(equalTo: phaseImageView.leadingAnchor),
      firstAnswerBallon.trailingAnchor.constraint(equalTo: phaseImageView.trailingAnchor),
      
      secondAnswerBallon.topAnchor.constraint(equalTo: firstAnswerBallon.bottomAnchor, constant: 10),
      secondAnswerBallon.leadingAnchor.constraint(equalTo: phaseImageView.leadingAnchor),
      secondAnswerBallon.trailingAnchor.constraint(equalTo: phaseImageView.trailingAnchor),
      
      thirdAnswerBallon.topAnchor.constraint(equalTo: secondAnswerBallon.bottomAnchor, constant: 10),
      thirdAnswerBallon.leadingAnchor.constraint(equalTo: phaseImageView.leadingAnchor),
      thirdAnswerBallon.trailingAnchor.constraint(equalTo: phaseImageView.trailingAnchor),
      
      thirdAnswerBallon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
  }
}
