import Foundation
import UIKit

protocol AskForHelpViewModelProtocol: AnyObject {
  func makePhoneCall(toNumber phoneNumber: String)
}

class AskForHelpViewModel: AskForHelpViewModelProtocol {
  func makePhoneCall(toNumber phoneNumber: String) {
    let cleanedNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

    guard let phoneURL = URL(string: "tel://\(cleanedNumber)") else {
      print("Erro: URL de telefone inválida.")
      return
    }
    if UIApplication.shared.canOpenURL(phoneURL) {
      UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
    } else {
      print("Este dispositivo não pode fazer chamadas telefônicas.")
      // showAlert(title: "Não é possível ligar", message: "Este dispositivo não suporta chamadas.")
    }
  }
}
