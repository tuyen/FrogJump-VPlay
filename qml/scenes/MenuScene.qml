import QtQuick 2.5
import VPlay 2.0
import "../entities"
BaseScene{
    id : menuScene
    signal gameScenePressed
    signal creditsPressed
    state : "sound_on"
    PhysicsWorld
    {
        debugDrawVisible: false // set this to true to show the physics overlay
        updatesPerSecondForPhysics: 60
        gravity.y: 20 // how much gravity do you want?
    }
    Image{
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/background.png"
    }
    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/frog-jumping.png"
    }
    FrogDemo
    {
        id: frog
        x: 90
        y: 350

    }

    Leaf
    {
        id: leaf1
        x: 75
        y: 400
    }

    // play button to start game
    Rectangle {
        width: 75
        height: 25
        x: parent.x + parent.width - 100
        y: 300
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
        width: 75
        height: 25
        x: parent.x + parent.width - 100
        y: 350
        id: btnSound
        Image {
            id: sound
            source: "../../assets/scoreButton.png"
            anchors.centerIn: parent
        }
        ScaleAnimator {
            id: soundAnimate
            target: btnPlay
            running: true
            from: 0.8
            to: 1
            duration: 1000
            easing.type: Easing.OutElastic // Easing used get an elastic wobbling instead of a linear scale change
        }
        MouseArea {
            id: soundArea
            anchors.fill: parent
            onClicked: gameScenePressed()
            hoverEnabled: true
            onPressed: gameScale.start()
        }
    }

    Rectangle {
        width: 25
        height: 10
        x: parent.x + parent.width - 70
        y: 400
        id: btnCredits
        Image {
            id: scoreSceneButton
            source: menuScene.state == "sound_on" ? "../../assets/loudspeaker.png" : "../../assets/loudspeaker-mute.png"
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
            onClicked: {
                if(menuScene.state == "sound_on"){
                    menuScene.state = "sound_off"
                    SoundEffectVPlay.muted
                }else
                    menuScene.state = "sound_on"
            }
            hoverEnabled: true
            onPressed: creScale.start()
        }
    }

}
