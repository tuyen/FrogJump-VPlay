import QtQuick 2.0
import VPlay 2.0

EntityBase
{
    id:fly//the id we use as a  reference inside this class
    entityType: "Fly"
    state: "stand"
    SpriteSequenceVPlay
    {
        id: flyImg
        defaultSource: "../../assets/spritesheet.png"
        scale: 0.15
        anchors.centerIn: flygCollider
        SpriteVPlay
        {
         name:"stand"
         frameCount: 2
         frameRate: 8
         frameHeight: 128
         frameWidth: 128
         frameX: 0
         frameY: 384
        }
    }
    BoxCollider
    {
      id: flygCollider
      width: 5 // width of the frog collider
      height: 5 // height of the frog collider
      bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
      collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
      fixture.onBeginContact:
      {
        var otherEntity = other.getBody().target
        var otherEntityType = otherEntity.entityType

        if(otherEntityType === "Border")
        {
          fly.x = utils.generateRandomValueBetween(32, gameScene.width - 64) // generate random x
          fly.y = 0 // the top of the screen
        }
      }
    }
    MovementAnimation {
      id: movement
      target: fly
      property: "y"
      velocity:  frog.impulse / 2 // impulse is y velocity of the frog
      running: frog.y < 210 // move only when the frog is jumping high enough
    }
    function setNewPossition()
    {
        fly.x = utils.generateRandomValueBetween(0,gameScene.width)
        fly.y -= gameScene.height
    }
}
