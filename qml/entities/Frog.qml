import QtQuick 2.0
import VPlay 2.0

EntityBase
{
    id:frogEntity //the id we use as a  reference inside this class
    entityType: "Frog"
    state: frogCollider.linearVelocity.y < 0 ?  "jumping" : "falling" // change state according to the frog's y velocity
    property  int  impulse: y - frogCollider.linearVelocity.y
    property alias controller: twoAxisController
    TwoAxisController
    {
        id: twoAxisController
    }
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
       rotation: frogEntity.state == "jumping" ?
                   (system.desktopPlatform ?
                       twoAxisController.xAxis * 15
                       : (accelerometer.reading !== null ? -accelerometer.reading.x * 10 : 0))
                   : 0
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
    BoxCollider
    {
      id: frogCollider
      width: 25 // width of the frog collider
      height: 1 // height of the frog collider
      bodyType: gameScene.state == "playing" ? Body.Dynamic : Body.Static
      linearVelocity.x: system.desktopPlatform ?
                  twoAxisController.xAxis * 200 :  //  for desktop
                  (accelerometer.reading !== null ? -accelerometer.reading.x * 100 : 0)
      // handle collision
      fixture.onContactChanged:
      {
        var otherEntity = other.getBody().target
        var otherEntityType = otherEntity.entityType
          if(otherEntityType==="Fly"||otherEntityType==="Fish")
          {
            score+=1
            otherEntity.setNewPossition()
          }
         if(otherEntityType === "Border"){
             frogEntity.die()
         }else
             if(otherEntityType === "leaf"&&frogEntity.state == "falling"&&gameScene.state=="playing")
             {
                frogCollider.linearVelocity.y = -400
                otherEntity.playWobbleAnimation()
             }
      }
    }
    function die()
    {
        frogEntity.x = gameScene.width/2
        frogEntity.y= 220
        frogCollider.linearVelocity.y = 0
        frogAnimation.jumpTo("sitting")
        lastscore = score
        score=0
        gameScene.state="gameOver"
    }
    onYChanged: {
      if(y < 200) {
        y = 200 // limit the frog's y value

      }
    }
}
