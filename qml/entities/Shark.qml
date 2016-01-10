import QtQuick 2.0
import VPlay 2.0

EntityBase
{
    id:shark
    entityType: "Shark"
    SpriteSequenceVPlay
    {
        id: sharkImg
        defaultSource: "../../assets/shark.png"
        scale: 1
        anchors.centerIn: sharkCollider
        SpriteVPlay
        {
         name:"goright"
         frameCount: 2
         frameRate: 3
         frameHeight: 50
         frameWidth: 60
         frameX: 0
         frameY: 0
        }
    }
    BoxCollider
    {
        id: sharkCollider
        width: 40 // width of the frog collider
        height: 30 // height of the frog collider
        bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
        collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
//        fixture.onBeginContact:
//        {
//          var otherEntity = other.getBody().target
//          var otherEntityType = otherEntity.entityType

//          if(otherEntityType === "Border")
//          {
//            shark.x = utils.generateRandomValueBetween(32, gameScene.width - 64) // generate random x
//            shark.y = -gameScene.height*1.5 // the top of the screen
//          }
//        }

    }
    MovementAnimation
    {
        id: movex
        target:shark
        property: "x"
        velocity: 20
        running:true
    }
    MovementAnimation {                
      id: movement
      target: shark
      property: "y"
      velocity:  frog.impulse / 2 // impulse is y velocity of the frog
      running: frog.y < 210 // move only when the frog is jumping high enough
    }
    onXChanged:
    {
        if(x>gameScene.width)
            x=-50
    }
    onYChanged: {
         if(y > gameScene.height+10)
         {
             shark.x = utils.generateRandomValueBetween(32, gameScene.width - 64) // generate random x
             shark.y -= gameScene.height // the top of the screen
         }
    }
}
