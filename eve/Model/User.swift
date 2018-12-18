import Foundation

public struct User: Codable {
  public let id: String
  
  init(id: String) {
    self.id = id
  }
}
