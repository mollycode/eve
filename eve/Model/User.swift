import Foundation

public struct User: Codable {
  public let id: String
  
  public let name: String
  
  init(id: String, name: String) {
    self.id = id
    self.name = name
  }
}
