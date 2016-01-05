import QtQuick 2.2
import VPlay 2.0

EntityBase {
  id: leaf

  entityType: "leaf" // always name your entityTypes

  width: 64 // visual width of our platform
  height: 32 // visual height of our platform

  Image {
    id: leafImg
    source: "../../assets/leaf.png"
    anchors.fill: leaf
  }

  // BoxCollider responsible for collision detection
  BoxCollider {
    id: leafCollider
    width: parent.width // actual width is the same as the parent entity
    height: parent.height - 20 // actual height is slightly smaller so the collision works smoother
    bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
    collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
  }
  MovementAnimation {
    id: movement
    target: leaf
    property: "y"
    velocity:  frog.impulse / 2 // impulse is y velocity of the frog
    running: frog.y < 210 // move only when the frog is jumping high enough
  }
}
