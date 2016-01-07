import QtQuick 2.5
import VPlay 2.0
import QtSensors 5.3
import "../entities"
BaseScene{
    id : gameScene
    width: 320
    height: 480
    property int score: 0
    property int lastscore: 0
    state:"start"
    SoundEffectVPlay {
        id: sounBackground
        source: "../../assets/snow-lullaby.wav"
        loops: 100
        //autoPlay: true
      }
    SoundEffectVPlay {
        id: soundFrog
        source: "../../assets/frog.wav"
        //loops:
        //autoPlay: true

      }
    SoundEffectVPlay {
        id: soundCoin
        source: "../../assets/coin.wav"

      }
    PhysicsWorld
    {
        debugDrawVisible: false // set this to true to show the physics overlay
        updatesPerSecondForPhysics: 60
        gravity.y: 20 // how much gravity do you want?
    }
    Keys.forwardTo: frog.controller



    MouseArea {
        id: mouseArea
        anchors.fill: gameScene.gameWindowAnchorItem
        onClicked: {

            if(gameScene.state === "start") { // if the game is ready and you click the screen we start the game
                gameScene.state = "playing"
                sounBackground.play()
            }
            if(gameScene.state === "gameOver") // if the frog is dead and you click the screen we restart the game
            {
                gameScene.state = "start"
                sounBackground.play()
            }
        }
    }

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

    Shark
    {
        id: shark1
        x:20
        y:20
    }
    Repeater{
        model: 10
        Fish{
            x: utils.generateRandomValueBetween(0, gameScene.width) // random value
            y: gameScene.height / 10 * index // distribute the platforms across the screen
        }
    }
    Leaf
    {
        id: leafbase
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
    Bird{
        id: bird1
        x: gameScene.width/2 - 100
        y: gameScene.height/2 + 50
    }

    Border
    {
        id: border
        x: -gameScene.width * 2
        y: gameScene.height // subtract a small value to make the border just visible in your scene
    }

    Image {
        id: infoText
        anchors.centerIn: parent
        source: gameScene.state == "gameOver" ? "../../assets/gameOverText.png" : "../../assets/clickToPlayText.png"
        visible: gameScene.state !== "playing"
    }
    // score button to open leaderboard
    Rectangle {
        width: 150
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: infoText.bottom
        anchors.margins: -50
        color: "orange"
        id: btnCredits
        visible: gameScene.state == "gameOver"
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
            onClicked: gameWindow.state = "credits"
            hoverEnabled: true
            onPressed: creScale.start()
        }
    }

}
