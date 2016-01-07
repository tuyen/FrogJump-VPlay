import QtQuick 2.5
import VPlay 2.0

BaseScene{
    id: aboutScene

    Image {
        id: backGroud
        source: "../../assets/background.png"
        anchors.fill: parent.gameWindowAnchorItem
    }

    Image {
        id: info
        source: "../../assets/info.png"
        anchors.centerIn: parent.gameWindowAnchorItem
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
            id: gameSceneMouseArea
            anchors.fill: parent
            onClicked: backButtonPressed()
            hoverEnabled: true
            onPressed: backScale.start()
        }
    }
}
