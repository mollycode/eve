import Firebase
import Foundation

extension FirebaseData: UserData {
  
  private enum Constants {
    static let tableName = "users"
  }
  
  public func saveUser(user: User) {
    do {
      let userJson = try JSONEncoder().encode(user)
      let userData = try JSONSerialization.jsonObject(with: userJson, options: []) as? [String: Any]
      guard let data = userData else { return }
      database.collection(Constants.tableName).document(user.id).setData(data)
    } catch {}
  }
  
  public func getUser(userId: String, callback: @escaping ((User?) -> Void)) {
    let ref = database.collection(Constants.tableName).document(userId)
    ref.getDocument { (document, error) in
      if let data = document?.data() {
        do {
          let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
          let user = try JSONDecoder().decode(User.self, from: jsonData)
          callback(user)
          return
        } catch{}
      }
      callback(nil)
    }
  }
}
