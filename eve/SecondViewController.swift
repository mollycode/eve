import UIKit

class SecondViewController: UIViewController {
  
  enum Constants {
    static let fontSize: CGFloat = 32
  }
  
  private var name: String? {
    didSet {
      nameLabel.text = name
      view.setNeedsUpdateConstraints()
      view.setNeedsLayout()
    }
  }
  
  private let nameLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .systemFont(ofSize: Constants.fontSize, weight: .bold)
    label.textColor = .white
    return label
  }()
  
  private var hasSetConstraints: Bool = false
  
  public init(userId: String) {
    super.init(nibName: nil, bundle: nil)
    API.data.getUser(userId: userId) { (user) in
      self.name = user?.name
    }
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init?(coder) not implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .blue
    view.addSubview(nameLabel)
    
    view.setNeedsUpdateConstraints()
  }

  override func updateViewConstraints() {
    nameLabel.sizeToFit()
    nameLabel.snp.updateConstraints { (make) in
      make.center.equalToSuperview()
      make.width.equalTo(nameLabel.bounds.width)
      make.height.equalTo(nameLabel.bounds.height)
    }
    super.updateViewConstraints()
  }
}

