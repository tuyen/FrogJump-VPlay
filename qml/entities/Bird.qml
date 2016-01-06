import QtQuick 2.0
import VPlay 2.0

EntityBase
{
    id:bird
    entityType: "Bird"
    SpriteSequenceVPlay
    {
        id: birdImg
        defaultSource: "../../assets/bird.png"
        scale: 1
        anchors.centerIn: birdCollider
        SpriteVPlay
        {
         name:"goleft"
         frameCount: 3
         frameRate: 3
         frameHeight: 65
         frameWidth: 66
         frameX: 0
         frameY: 0
        }
    }
    BoxCollider
    {
        id: birdCollider
        width: 15 // width of the frog collider
        height: 5 // height of the frog collider
        bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
        collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
        fixture.onBeginContact:
        {
          var otherEntity = other.getBody().target
          var otherEntityType = otherEntity.entityType

          if(otherEntityType === "Border")
          {
            bird.x = utils.generateRandomValueBetween(32, gameScene.width - 64) // generate random x
            bird.y = -gameScene.height*1.5 // the top of the screen
          }
        }

    }
    MovementAnimation {
      id: movement
      target: bird
      property: "y"
      velocity:  frog.impulse / 2 // impulse is y velocity of the frog
      running: frog.y < 210 // move only when the frog is jumping high enough
    }

}
