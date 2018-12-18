import Foundation

public protocol UserData {
  func saveUser(user: User)
  func getUser(userId: String)
}
