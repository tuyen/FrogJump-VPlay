import QtQuick 2.0
import VPlay 2.0
import "../scenes"

EntityBase
{
    entityType: "Border"
    BoxCollider
    {
        width: GameScene.width*5
        height: 50
        bodyType: Body.Static
        collisionTestingOnlyMode: true
        Rectangle{
            anchors.fill: parent
            color:"red"
            visible: true
        }
    }
}
