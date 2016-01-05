import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: oldLeafEntity

    entityType: "oldLeafType" // always name your entityTypes
    state: "default"
    width: 64 // visual width of our platform
    height: 32 // visual height of our platform

    SpriteSequenceVPlay
    {
        id:oldLeafAnimation

        scale: 0.35
        anchors.centerIn: oldLeafEntity
        SpriteVPlay
        {
            name: "default"
            source: "../../assets/old-leaf.png"
            frameWidth: 128
            frameHeight: 128
            startFrameColumn: 1
        }
        SpriteVPlay
        {
            name:"broken"
            source: "../../assets/old-leaf-break.png"
            frameWidth: 128
            frameHeight: 128
            startFrameColumn: 1
        }
    }

    onStateChanged:
    {
        if(oldLeafEntity.state=="broken")
        {
            oldLeafAnimation.jumpTo("broken")//change the current animation to jumping
        }
    }

    // BoxCollider responsible for collision detection
    BoxCollider {
        id: oldLeafCollider
        width: parent.width // actual width is the same as the parent entity
        height: parent.height - 20 // actual height is slightly smaller so the collision works smoother
        bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
        collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies

        fixture.onBeginContact:
        {
            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType
            if(otherEntityType === "Frog"){
                oldLeafEntity.state = "broken"
                oldLeafCollider.linearVelocity.y = 10
                oldLeafCollider.collisionTestingOnlyMode= false
            }
        }
    }
}