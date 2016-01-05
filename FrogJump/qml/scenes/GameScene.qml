import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.5
import "../object"

Scene{
    id : gameScene
    width: 320
    height: 480
    PhysicsWorld
    {
      debugDrawVisible: true // set this to true to show the physics overlay
      updatesPerSecondForPhysics: 60
      gravity.y: 20 // how much gravity do you want?
    }
    Keys.forwardTo: frog.controller

     Accelerometer {
       id: accelerometer
       active: true
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
    Repeater{
     model: 10
     Leaf{
       x: utils.generateRandomValueBetween(0, gameScene.width) // random value
       y: gameScene.height / 10 * index // distribute the platforms across the screen
     }
   }
    Border {
      id: border
      x: -gameScene.width * 2
      y: gameScene.height - 50 // subtract a small value to make the border just visible in your scene
    }
}
