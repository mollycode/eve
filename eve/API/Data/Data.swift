import Foundation

public protocol Data: UserData {
  static var sharedInstance: Data { get }
}
