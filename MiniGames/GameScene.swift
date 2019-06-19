//
//  GameScene.swift
//  MiniGames
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate {
    
    var nextLevelButton:SKLabelNode!
    
    // sprites
 
   // var lemmingArray:[SKNode] = []
    let lem = SKSpriteNode(imageNamed: "right1")
   
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        
        
        // Required for SKPhysicsContactDelegate
        self.physicsWorld.contactDelegate = self
        
        // make lemming
        self.makeLemming()
    
        let a = (self.size.width/2)
        let b = self.size.width/2
        
       let m1 = SKAction.moveBy(x: a, y: 0, duration: 3)
       // --- 1b. move right
       let m2 = SKAction.moveBy(x: b, y: 0, duration: 3)
       
       // 2. put actions into a sequence
       let sequence = SKAction.sequence([m1,m2])
        
       // 3. apply sequence to sprite
       self.lem.run(SKAction.repeatForever(sequence))
    
        if(a==100)
        {
            let a = -(self.size.width*2)
            
            let m1 = SKAction.moveBy(x: a, y: 0, duration: 3)
            // --- 1b. move right
            let m2 = SKAction.moveBy(x: b, y: 0, duration: 3)
            
            // 2. put actions into a sequence
            let sequence = SKAction.sequence([m1,m2])
            
            // 3. apply sequence to sprite
            self.lem.run(SKAction.repeatForever(sequence))
        }
    }
    
    func makeLemming()
    {
        //add a lemming
       // let lem = SKSpriteNode(imageNamed: "right1")
        
        //generate a random(x,y) for lem
        let randX = 440
        let randY = 1020
        
        lem.position = CGPoint(x:randX, y:randY)
        
        addChild(lem)
        
        print("Where is lemming:\(randX),\(randY)")
    }
    
    func makePlatform(xPosition:CGFloat, yPosition:CGFloat) {
        // 1. create an platform sprite
        let platform = SKSpriteNode(imageNamed: "platform")
        
        // 2. set initial position of orange to be same
        // as where mouse is clicked
        platform.position.x = xPosition;
        platform.position.y = yPosition;
        print("Where is platform:\(xPosition),\(yPosition)")
        // 3. set physics for the platform
        // -- dyanmic = true
        // -- gravity = true
        
        // 4. Add the orange to the scene
        addChild(platform)
       
   }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
       var mouseStartingPosition:CGPoint = CGPoint(x:0, y:0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        // 1. detect where the person clicked
        let touch = touches.first!
        let mousePosition = touch.location(in:self)
        
        
       //2.make platform in same position as mouse clicked
        
        // 2a. What did the person click?
        let spriteTouched = self.atPoint(mousePosition)
        
        //2a.if person click on button
        if(spriteTouched.name == "nextLevelButton")
        {
            let location = touch.location(in:self)
            let node = self.atPoint(location)
            
            // MARK: Switch Levels
            if (node.name == "nextLevelButton") {
                let scene = SKScene(fileNamed:"Level2")
                if (scene == nil) {
                    print("Error loading level")
                    return
                }
                else {
                    scene!.scaleMode = .aspectFill
                    view?.presentScene(scene!)
                }
            }
        }
        else
        {
            self.makePlatform(xPosition:mousePosition.x,yPosition:mousePosition.y)
            
        }
        
      
        
    }
}

