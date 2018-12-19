import Firebase
import Foundation

final class FirebaseData: Data {
  
  static let sharedInstance: FirebaseData = {
    return FirebaseData()
  }()
  
  let database: Firestore
  
  private init() {
    FirebaseApp.configure()
    
    database = Firestore.firestore()
  }
}
