import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.5
import "../object"

Scene{
    id : gameScene
    width: 320
    height: 480
    PhysicsWorld {
      debugDrawVisible: false // set this to true to show the physics overlay
      updatesPerSecondForPhysics: 60
      gravity.y: 20 // how much gravity do you want?
    }
    Image{
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/background.png"
    }
    Frog
    {
        id: frog
        x: gameScene.width/2
        y: gameScene.height/2

    }
    Leaf
    {
        id: leaf1
        x: gameScene.width/2
        y: gameScene.height/2

    }
    BoxCollider{
      id: platform
      x: gameScene.width / 2
      y: 300
    }

}
