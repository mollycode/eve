import Foundation

public struct Event: Codable {
  
  public let creator: User
  
  public let name: String
  
  public let startTime: Date
  
  public let endTime: Date
  
  public let description: String
  
  init(creator: User,
       name: String,
       startTime: Date,
       endTime: Date,
       description: String) {
    self.creator = creator
    self.name = name
    self.startTime = startTime
    self.endTime = endTime
    self.description = description
  }
}
