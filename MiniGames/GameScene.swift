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
  
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        
        // Required for SKPhysicsContactDelegate
        self.physicsWorld.contactDelegate = self
        
        // make array of lemming
//        let l1 = self.childNode(withName: "lemming1")
//        let l2 = self.childNode(withName: "lemming2")
//        let l3 = self.childNode(withName: "lemming3")
//        let l4 = self.childNode(withName: "lemming4")
//        self.lemmingArray.append(l1!)
//        self.lemmingArray.append(l2!)
//        self.lemmingArray.append(l3!)
//        self.lemmingArray.append(l4!)
    
    
    }
    
    
    func makePlatform(xPosition:CGFloat, yPosition:CGFloat) {
        // 1. create an platform sprite
        let platform = SKSpriteNode(imageNamed: "platform")
        
        // 2. set initial position of orange to be same
        // as where mouse is clicked
        platform.position.x = xPosition;
        platform.position.y = yPosition;
        
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

