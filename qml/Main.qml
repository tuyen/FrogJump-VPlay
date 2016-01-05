import VPlay 2.0
import QtQuick 2.0
import "scenes"
GameWindow {
    id: gameWindow

    activeScene: scene

    width: 320
    height: 480

    EntityManager {
       id: entityManager
       entityContainer: scene
     }

    GameScene{
        id: scene

    }
}

