import QtQuick 2.0
import VPlay 2.0

EntityBase
{
    id:fish//the id we use as a  reference inside this class
    entityType: "Fish"
    state: "goright"
    SpriteSequenceVPlay
    {
        id: fishImg
        defaultSource: "../../assets/fish.png"
        scale: 0.3
        anchors.centerIn: fishgCollider
        state:"goleft"
        SpriteVPlay
        {
         name:"goright"
         frameCount: 5
         frameRate: 15
         frameHeight: 35
         frameWidth: 70
         frameX: 0
         frameY: 0
        }
        SpriteVPlay
        {
         name:"goleft"
         frameCount: 5
         frameRate: 15
         frameHeight: 35
         frameWidth: 70
         frameX: 0
         frameY: 70
        }
    }
    BoxCollider
    {
        id: fishgCollider
        width: 15 // width of the frog collider
        height: 15 // height of the frog collider
        bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
        collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
        fixture.onBeginContact:
        {

          var otherEntity = other.getBody().target
          var otherEntityType = otherEntity.entityType

          if(otherEntityType === "Border")
          {
            fish.x = utils.generateRandomValueBetween(32, gameScene.width - 64) // generate random x
            fish.y = 0 // the top of the screen
          }
          if(otherEntityType === "Shark")
          {
            fish.x = utils.generateRandomValueBetween(32, gameScene.width - 64) // generate random x
            fish.y = 0 // the top of the screen
          }
        }
    }
    MovementAnimation {
      id: movement
      target: fish
      property: "y"
      velocity:  frog.impulse / 2 // impulse is y velocity of the frog
      running: frog.y < 210 // move only when the frog is jumping high enough
    }
    function setNewPossition()
    {
        fish.x = utils.generateRandomValueBetween(0,gameScene.width)
        fish.y -= gameScene.height
    }
    MovementAnimation
    {
        id:fishmovex
        target:fish
        property: "x"
        velocity: -20
        running: true
    }
    onXChanged:
    {
        if(x<-3)
            x=gameScene.width+10
    }
}
