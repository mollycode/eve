import Firebase
import UIKit

class FirstViewController: UIViewController {
  private var handle: AuthStateDidChangeListenerHandle?

  init() {
    super.init(nibName: nil, bundle: nil)
    
    view.backgroundColor = .white
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder) not implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
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


}

