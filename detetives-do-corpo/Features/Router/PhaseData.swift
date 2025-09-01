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
    
    // MARK: - Mission 2
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
      medalDescription: L10n.congratulationsYouSaidNo),
  
    // MARK: - Mission 3
    
    MissionsPhases(
      phases: [
        PhaseData(
          imageName: "aniversario1",
          history: L10n._3rdMissionBaloonHistory,
          answers: [L10n._3rdMissionFirstAnswerBaloon,
                    L10n._3rdMissionSecondAnswerBaloon,
                    L10n._3rdMissionThirdAnswerBaloon],
          correctAnwserIndex: 2),
        PhaseData(imageName: "aniversario2",
                  history: L10n._3rdMissionSecondScreenBaloonHistory,
                  answers: [L10n._3rdMissionSecondScreenFirstAnswerBaloon,
                            L10n._3rdMissionSecondScreenSecondAnswerBaloon,
                            L10n._3rdMissionSecondScreenThirdAnswerBaloon],
                  correctAnwserIndex: 2),
        PhaseData(imageName: "aniversario3",
                  history: L10n._3rdMissionThirdScreenBaloonHistory,
                  answers: [L10n._3rdMissionThirdScreenFirstAnswerBaloon,
                            L10n._3rdMissionThirdScreenSecondAnswerBaloon,
                            L10n._3rdMissionThirdScreenThirdAnswerBaloon],
                  correctAnwserIndex: 0)],
      conquestImageName: "medal3",
      medalDescription: L10n.congratulationsYouHelped),
    
    // MARK: - Mission 4
    
    MissionsPhases(
      phases: [
        PhaseData(
          imageName: "banheiro1",
          history: L10n._4thMissionBaloonHistory,
          answers: [L10n._4thMissionFirstAnswerBaloon,
                    L10n._4thMissionSecondAnswerBaloon,
                    L10n._4thMissionThirdAnswerBaloon],
          correctAnwserIndex: 2),
        PhaseData(imageName: "banheiro2",
                  history: L10n._4thMissionSecondScreenBaloonHistory,
                  answers: [L10n._4thMissionSecondScreenFirstAnswerBaloon,
                            L10n._4thMissionSecondScreenSecondAnswerBaloon,
                            L10n._4thMissionSecondScreenThirdAnswerBaloon],
                  correctAnwserIndex: 2)],
      conquestImageName: "banheiro3",
      medalDescription: L10n.congratulationsYouUnderstoodYourBoundries),
  ]
}
