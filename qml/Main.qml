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
        achievements: [
            Achievement {
                key: "5opens"
                name: "Game Opener"
                iconSource: "../assets/frog-jumping.png"
                target: 5
                points: 10
                description: "Open this game 5 times"
            },
            Achievement {
                key: "die"
                name: "Difficult gaming?"
                iconSource: "../assets/achievementImage.png"
                target: 100
                points: 20
                description: "Die 100 times"
            },Achievement {
                key: "growth"
                name: "Bigger & Bigger"
                iconSource: "../assets/frog.png"
                target: 5
                points: 30
                description: "Growth up 5 times"
            },Achievement {
                key: "king"
                name: "Be the best"
                iconSource: "../assets/king.png"
                target: 1
                points: 100
                description: "Get scores over 500 points"
            },Achievement {
                key: "killfish"
                name: "Dick Frog"
                iconSource: "../assets/killfish.png"
                target: 1
                points: 50
                description: "Eating over 500 small fish"
            },Achievement {
                key: "killbird"
                name: "Nothing to be scare!!!"
                iconSource: "../assets/killbird.png"
                target: 1
                points: 50
                description: "Killing over 100 angry birds"
            },Achievement {
                key: "killlFish"
                name: "Lord of the marsh!!!"
                iconSource: "../assets/killlfish.png"
                target: 1
                points: 200
                description: "Killing over 200 angry birds and big fishes"
            }
        ]
    }
    MenuScene{
        id: menuScene
        onCreditsPressed: gameWindow.state = "credits"
        onGameScenePressed: gameWindow.state = "game"
        onAboutPressed: gameWindow.state = "about"
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

    GameOverScene{
        id: gameOverScene
        onCreditsPressed: gameWindow.state = "credits"
        onGameScenePressed: gameWindow.state = "game"
        onBackButtonPressed: gameWindow.state = "menu"
    }

    AboutScene{
        id: aboutScene
        onBackButtonPressed: gameWindow.state = "menu"

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
        },
        State {
            name: "gameOver"
            PropertyChanges {
                target: gameOverScene;
                opacity : 1
            }
            PropertyChanges {target: gameWindow; activeScene: gameOverScene}
        },
        State {
            name: "about"
            PropertyChanges {
                target: aboutScene;
                opacity : 1
            }
            PropertyChanges {target: gameWindow; activeScene: aboutScene}
        }
    ]
}

