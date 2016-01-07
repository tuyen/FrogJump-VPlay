import QtQuick 2.5
import VPlay 2.0

BaseScene{
    id : gameOverScene
    signal gameScenePressed
    signal creditsPressed

    Image{
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/background.png"
    }
    Image {
        id: scoreCounter
        source: "../../assets/panel.png"
        height: 200
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        y: 100
        // text component to show the score
        Text {
            id: scoreText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 20
            text: "your score: " + gameScene.lastscore + gameNetwork.userHighscoreForLeaderboard()
        }
    }
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300
        spacing: 20

        // play button to start game
        Rectangle {
            width: 100
            height: 25
            id: btnPlay

            Image {
                id: gameSceneButton
                scale: 1.5
                source: "../../assets/playButton.png"
                anchors.centerIn: parent
            }
            ScaleAnimator {
            id: gameScale
            target: btnPlay
            running: true
            from: 0.8
            to: 1
            duration: 1000
            easing.type: Easing.OutElastic // Easing used get an elastic wobbling instead of a linear scale change
          }
            MouseArea {
                id: gameSceneMouseArea
                anchors.fill: parent
                onClicked: gameScenePressed()
                hoverEnabled: true
                onPressed: gameScale.start()
            }
        }

        // score button to open leaderboard
        Rectangle {
            id: btnCredits
            width: 100
            height: 25

            Image {
                id: scoreSceneButton
                scale: 1.5
                source: "../../assets/scoreButton.png"
                anchors.centerIn: parent
            }
            ScaleAnimator {
            id: creScale
            target: btnCredits
            running: true
            from: 0.8
            to: 1
            duration: 1000
            easing.type: Easing.OutElastic // Easing used get an elastic wobbling instead of a linear scale change
          }
            MouseArea {
                id: scoreSceneMouseArea
                anchors.fill: parent
                onClicked: creditsPressed()
                hoverEnabled: true
                onPressed: creScale.start()
            }
        }
    }




}
