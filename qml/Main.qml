import VPlay 2.0
import QtQuick 2.0
import "scenes"
GameWindow {
    id: gameWindow

    activeScene: gameScene

    width: 320
    height: 480


    EntityManager {
        id: entityManager
        entityContainer: gameScene
    }
    VPlayGameNetwork {
        id: gameNetwork
        gameId: 212
        secret: "FrogJumping"
        gameNetworkView: frogNetworkView
    }
    MenuScene{
        id: menuScene
        onCreditsPressed: gameWindow.state = "credits"
        onGameScenePressed: gameWindow.state = "game"
        onBackButtonPressed: gameWindow.close()
    }

    CreditsScene{
        id: creditsScene
        onBackButtonPressed: gameWindow.state = "menu"
        VPlayGameNetworkView {
            id: frogNetworkView
            visible: true
            anchors.fill: parent.gameWindowAnchorItem
            onBackClicked: {
                gameWindow.state = "menu"
            }
        }
    }

    GameScene{
        id: gameScene
    }

    state: "menu"
    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: menuScene;
                opacity : 1
            }
            PropertyChanges {target: gameWindow; activeScene: menuScene}
        },
        State {
            name: "credits"
            PropertyChanges {
                target: creditsScene;
                opacity : 1
            }
            PropertyChanges {target: gameWindow; activeScene: creditsScene}
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameScene;
                opacity : 1
            }
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        }
    ]
}

