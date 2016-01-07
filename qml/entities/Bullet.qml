import QtQuick 2.0
import VPlay 2.0

EntityBase
{
    id:bullet//the id we use as a  reference inside this class
    entityType: "Bullet"
    visible: true
    Image {
        id: imgBullet
        source: "../../assets/bullet.png"
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

        if(otherEntityType === "Shark"||otherEntityType ==="Bird")
        {
          bullet.visible=false
          otherEntity.y-=gameScene.height*2
          otherEntity.x = utils.generateRandomValueBetween(0,gameScene.width-50)
          score+=10
        }
      }
    }
    MovementAnimation {
      id: movement
      target: bullet
      property: "y"
      velocity:  frog.impulse / 2 // impulse is y velocity of the frog
      running: frog.y < 210 // move only when the frog is jumping high enough
    }
    MovementAnimation {
      id: movementy
      target: bullet
      property: "y"
      velocity:  -300 // impulse is y velocity of the frog
      running: true// move only when the frog is jumping high enough
    }
    onYChanged: {
        if(y<0)
            visible=false
    }

}
