import VPlay 2.0
import QtQuick 2.0
import "scenes"
GameWindow {
    id: gameWindow

    activeScene: gameScene

    EntityManager{
        id: entityManager
        entityContainer: gameScene
    }

    GameScene{
        id: gameScene
    }
}

