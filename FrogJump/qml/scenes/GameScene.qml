import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.5
import "../"

Scene{
    id : gameScene
    width: 320
    height: 480

    Image{
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/background.png"
    }
}
