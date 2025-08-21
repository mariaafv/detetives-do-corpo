import UIKit

enum MissionStatus: String, Codable {
  case locked, unlocked, completed
}

struct Mission: Codable {
  var title: String
  var description: String
  var imageName: String
  var status: MissionStatus
  
  var image: UIImage? {
    UIImage(named: imageName)
  }
}
