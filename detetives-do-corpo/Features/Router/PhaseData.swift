struct PhaseData {
  let imageName: String
  let history: String
  let answers: [String]
  let correctAnwserIndex: Int
}

struct MissionsPhases {
  let phases: [PhaseData]
  let conquestImageName: String
  let medalDescription: String
}

struct MissionPhase {
  let missions: [MissionsPhases] = [
    MissionsPhases(
      phases: [
        //MARK: - Mission 1
        PhaseData(
          imageName: "lara1",
          history: L10n._1stMissionFirstBaloonHistory,
          answers: [L10n._1stMissionFirstAnswerBaloon,
                    L10n._1stMissionSecondAnswerBaloon,
                    L10n._1stMissionThirdAnswerBaloon],
          correctAnwserIndex: 1),
        
        PhaseData(imageName: "lara2",
                  history: L10n._1stMissionSecondScreenFirstBaloonHistory,
                  answers: [L10n._1stMissionSecondScreenFirstAnswerBaloon,
                            L10n._1stMissionSecondScreenSecondAnswerBaloon,
                            L10n._1stMissionSecondScreenThirdAnswerBaloon],
                  correctAnwserIndex: 0),
        
        PhaseData(imageName: "lara3",
                  history: L10n._1stMissionThirdScreenFirstBaloonHistory,
                  answers: [L10n._1stMissionThirdScreenFirstAnswerBaloon,
                            L10n._1stMissionThirdScreenSecondAnswerBaloon,
                            L10n._1stMissionThirdScreenThirdAnswerBaloon],
                  correctAnwserIndex: 0)],
      conquestImageName: "medal1",
      medalDescription: L10n.congratulationsYouAndLara),
    
    // MARK: - Missão 2
    MissionsPhases(
      phases: [
        PhaseData(
          imageName: "tio1",
          history: L10n._2ndMissionFirstBaloonHistory,
          answers: [L10n._2ndMissionFirstAnswerBaloon,
                    L10n._2ndMissionSecondAnswerBaloon,
                    L10n._2ndMissionThirdAnswerBaloon],
          correctAnwserIndex: 2),
        PhaseData(imageName: "tio2",
                  history: L10n._2ndMissionSecondScreenBaloonHistory,
                  answers: [L10n._2ndMissionSecondScreenFirstAnswerBaloon,
                            L10n._2ndMissionSecondScreenSecondAnswerBaloon,
                            L10n._2ndMissionSecondScreenThirdAnswerBaloon],
                  correctAnwserIndex: 1),
        PhaseData(imageName: "tio3",
                  history: L10n._2ndMissionThirdScreenBaloonHistory,
                  answers: [L10n._2ndMissionThirdScreenFirstAnswerBaloon,
                            L10n._2ndMissionThirdScreenSecondAnswerBaloon,
                            L10n._2ndMissionThirdScreenThirdAnswerBaloon],
                  correctAnwserIndex: 0)],
      conquestImageName: "medal2",
      medalDescription: L10n.congratulationsYouSaidNo)]
}
