import UIKit

struct Mission {
  let title: String
  let description: String
  let image: UIImage?
  let isUnlocked: Bool
  let navigate: (() -> Void)?
}
