import Firebase
import SnapKit
import UIKit

class RootViewController: UIViewController {
  private enum Constants {
    static let signinButtonTitle = "Sign in"
    static let signinErrorTitle = "Uhoh"
    static let signinErrorText = "Something went wrong. Try again?"
    static let dismissText = "Dismiss"
    
    static let padding: CGFloat = 16
    static let buttonHeight: CGFloat = 36
  }
  
  private var handle: AuthStateDidChangeListenerHandle?
  
  private var hasSetConstraints: Bool = false
  
  private let signinButton: UIButton = {
    let button = UIButton(frame: .zero)
    button.backgroundColor = .blue
    button.setTitle(Constants.signinButtonTitle, for: .normal)
    return button
  }()

  // MARK: - Initializers

  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init?(coder) not implemented")
  }

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    signinButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
    view.addSubview(signinButton)
    view.updateConstraintsIfNeeded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
      // ...
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    Auth.auth().removeStateDidChangeListener(handle!)
  }
  
  // MARK: - Overrides
  
  override func updateViewConstraints() {
    if !hasSetConstraints {
      signinButton.snp.makeConstraints { make in
        make.center.equalToSuperview()
        make.width.equalToSuperview().inset(Constants.padding * 4)
        make.height.equalTo(Constants.buttonHeight)
      }
    }
    super.updateViewConstraints()
  }
  
  // MARK: - Private
  
  private func showSigninErrorAlert() {
    let action = UIAlertAction(title: Constants.dismissText, style: .cancel, handler: nil)
    let alert = UIAlertController(title: Constants.signinErrorTitle,
                                  message: Constants.signinErrorText,
                                  preferredStyle: .alert)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }

  @objc
  private func signInTapped(sender: UIButton) {
    Auth.auth().signInAnonymously { (authResult, error) in
      guard error == nil, let result = authResult else {
        self.showSigninErrorAlert()
        return
      }
      let user = User(id: result.user.uid, name: "Molly")
      API.data.saveUser(user: user)
      self.present(SecondViewController(userId: result.user.uid), animated: true, completion: nil)
    }
  }

}

