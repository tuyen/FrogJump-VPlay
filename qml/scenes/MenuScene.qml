import QtQuick 2.0
import VPlay 2.0

BaseScene{
    id : menuScene
    signal gameScenePressed
    signal creditsPressed

    Image{
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/background.png"
    }
    Column {
        anchors.centerIn: parent
        spacing: 20

        // play button to start game
        Rectangle {
          width: 150
          height: 50
          color: "orange"
          Image {
            id: gameSceneButton
            source: "../../assets/playButton.png"
            anchors.centerIn: parent
          }

          MouseArea {
            id: gameSceneMouseArea
            anchors.fill: parent
            onClicked: gameScenePressed()
          }
        }

        // score button to open leaderboard
        Rectangle {
          width: 150
          height: 50
          color: "orange"
          Image {
            id: scoreSceneButton
            source: "../../assets/scoreButton.png"
            anchors.centerIn: parent
          }
          MouseArea {
            id: scoreSceneMouseArea
            anchors.fill: parent
            onClicked: creditsPressed()
          }
        }
    }


}
