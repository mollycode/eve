import Firebase
import Foundation

public final class FirebaseData: Data {
  
  public static let sharedInstance: Data = {
    FirebaseData()
  }()
  
  let database: Firestore
  
  private init() {
    FirebaseApp.configure()
    
    database = Firestore.firestore()
  }
}
