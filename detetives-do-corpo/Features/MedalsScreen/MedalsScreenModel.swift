import Foundation

struct Medal: Identifiable {
  let id: UUID = UUID()
  let title: String
  let description: String
  let imageName: String
  var isEarned: Bool
}
