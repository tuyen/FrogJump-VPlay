import QtQuick 2.2
import VPlay 2.0

EntityBase {
  id: oldLeaf

  entityType: "OldLeaf" // always name your entityTypes

  width: 64 // visual width of our platform
  height: 32 // visual height of our platform

  Image {
    id: oldLeafImg
    source: "../../assets/old-leaf.png"
    anchors.fill: oldLeaf
  }

  // BoxCollider responsible for collision detection
  BoxCollider {
    id: oldLeafCollider
    width: parent.width // actual width is the same as the parent entity
    height: parent.height - 20 // actual height is slightly smaller so the collision works smoother
    bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
    collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
  }
}
