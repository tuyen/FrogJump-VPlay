import QtQuick 2.0
import VPlay 2.0
import "../scenes"
EntityBase
{
    id:frogDemoEntity
    entityType: "Frog"
    state: frogCollider.linearVelocity.y < 0 ?  "jumping" : "falling"
    property  int  impulse: y - frogCollider.linearVelocity.y


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
    }
    onStateChanged:
    {
        if(frogDemoEntity.state=="jumping")
        {
            frogAnimation.jumpTo("jumping")//change the current animation to jumping
        }
        if(frogDemoEntity.state=="falling")
        {
            frogAnimation.jumpTo("sitting")
        }
    }
    BoxCollider
    {
        id: frogCollider
        width: 30 // width of the frog collider
        height: 20 // height of the frog collider
        bodyType:  Body.Dynamic

        // handle collision
        fixture.onContactChanged:
        {
            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            if(otherEntityType === "leaf"&&frogDemoEntity.state == "falling")
            {
                frogCollider.linearVelocity.y = -400
                otherEntity.playWobbleAnimation()
            }
        }
    }
}
