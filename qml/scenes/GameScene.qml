import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.3
import "../entities"
Scene{
    id : gameScene
    width: 320
    height: 480
    property int score: 0
    property int lastscore: 0
    state:"start"
    PhysicsWorld
    {
        debugDrawVisible: false // set this to true to show the physics overlay
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

    Image {
        id: scoreCounter
        source: "../../assets/scoreCounter.png"
        height: 80
        x: -15
        y: -15
        // text component to show the score
        Text {
            id: scoreText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 32
            text: score
        }
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

    OldLeaf{
        id: oldLeaf
        x: gameScene.width/2 - 100
        y: gameScene.height/2 + 50
    }

    Repeater{
        model: 10
        Leaf{
            x: utils.generateRandomValueBetween(0, gameScene.width) // random value
            y: gameScene.height / 10 * index // distribute the platforms across the screen
        }
    }
    Repeater{
        model: 10
        Fish{
            x: utils.generateRandomValueBetween(0, gameScene.width) // random value
            y: gameScene.height / 10 * index // distribute the platforms across the screen
        }
    }
    Repeater
    {
        model: 3
        Fly
        {
            x: utils.generateRandomValueBetween(0,gameScene.width)
            y:gameScene.height/3*index
        }
    }
    Repeater
    {
        model: 3
        OldLeaf
        {
            x: utils.generateRandomValueBetween(0,gameScene.width)
            y:gameScene.height/3*index
        }
    }
    Border {
        id: border
        x: -gameScene.width * 2
        y: gameScene.height - 50 // subtract a small value to make the border just visible in your scene
    }
    MouseArea {
        id: mouseArea
        anchors.fill: gameScene.gameWindowAnchorItem
        onClicked: {
            if(gameScene.state === "start") { // if the game is ready and you click the screen we start the game
                gameScene.state = "playing"
            }
            if(gameScene.state === "gameOver") // if the frog is dead and you click the screen we restart the game
            {
                gameScene.state = "start"
            }
        }
    }

    Image {
        id: infoText
        anchors.centerIn: parent
        source: gameScene.state == "gameOver" ? "../../assets/gameOverText.png" : "../../assets/clickToPlayText.png"
        visible: gameScene.state !== "playing"
    }
    Image {
        id: infobtScore
        x:50
        y:20
        height: 140
        source: "../../assets/scoreButton.png"
        visible: gameScene.state === "gameOver"
    }
    Image {
        id: infolbScore
        x:100
        y:120
        height: 60
        source: "../../assets/scoreCounter.png"
        visible: gameScene.state === "gameOver"
        // text component to show the score
        Text {
            id: infotscore
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 32
            text: lastscore
        }
    }

}
