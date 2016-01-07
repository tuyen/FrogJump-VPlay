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
    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        scale: 0.7
        source: "../../assets/gameOverText.png"
    }
    Image {
        id: scoreCounter
        source: "../../assets/panel.png"

        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        // text component to show the score
        Text {
            id: scoreText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 20
            text: "your score " + gameScene.lastscore + "\nyour highscore " + gameNetwork.userHighscoreForCurrentActiveLeaderboard
        }
    }
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 350
        spacing: 20

        // play button to start game
        Rectangle {
            width: 110
            height: 35
            id: btnPlay

            Image {
                id: gameSceneButton

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
            width: 110
            height: 35

            Image {
                id: scoreSceneButton

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

    Rectangle {
        width: 110
        height: 35

        id: btnBack
        Image {
            id: backButton
            source: "../../assets/backButton.png"
            anchors.centerIn: parent
        }
        ScaleAnimator {
            id: backScale
            target: btnBack
            running: true
            from: 0.8
            to: 1
            duration: 1000
            easing.type: Easing.OutElastic // Easing used get an elastic wobbling instead of a linear scale change
        }
        MouseArea {
            id: backArea
            anchors.fill: parent
            onClicked: backButtonPressed()
            hoverEnabled: true
            onPressed: backScale.start()
        }
    }
}
