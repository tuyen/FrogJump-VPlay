import QtQuick 2.0
import VPlay 2.0

EntityBase
{
    id:frogEntity //the id we use as a  reference inside this class
    entityType: "Frog"
    SpriteSequenceVPlay
    {
        id:frogAnimation
        defaultSource: "../../assets/spritesheet.png"
        scale: 0.35
        anchors.centerIn: frogCollider
        SpriteVPlay
        {
            name: "sitting"
            frameWidth: 128
            frameHeight: 128
            startFrameColumn: 2
        }
       SpriteVPlay
       {
        name:"jumping"
        frameCount: 4
        frameRate: 8
        frameHeight: 256
        frameWidth: 128
        frameX: 0
        frameY: 128
       }
       onStateChanged:
       {
            if(frogEntity.state=="jumping")
            {
                frogAnimation.jumpTo("jumping")//change the current animation to jumping
            }
            if(frogEntity.state=="falling")
            {
                frogAnimation.jumpTo("sitting")
            }
       }

    }
    BoxCollider {
      id: frogCollider

      width: 25 // width of the frog collider
      height: 5 // height of the frog collider

      bodyType: Body.Dynamic

      // handle collision
      fixture.onContactChanged: {
        frogCollider.linearVelocity.y = -400
      }
    }
}
