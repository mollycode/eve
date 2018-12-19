import Foundation

public struct API {
  
  static var data: Data!
  
  static func setup() {
    data = FirebaseData.sharedInstance
  }
  
}
