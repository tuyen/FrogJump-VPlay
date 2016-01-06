import QtQuick 2.0
import VPlay 2.0
import "../scenes"

EntityBase
{
    id:border
    entityType: "Border"
    width: gameScene.width*5
    height: 10
    BoxCollider
    {
        width: border.width
        height: border.height
        bodyType: Body.Static
        collisionTestingOnlyMode: true
        Rectangle{
            anchors.fill: parent
            color:"red"
            visible: true
        }
    }
}
